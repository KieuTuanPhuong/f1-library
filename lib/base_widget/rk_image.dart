import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:template/utils/color_resources.dart';
import 'package:template/utils/images_path.dart';

import '../helper/rk_dimensions.dart';
import '../helper/rk_validate.dart';

// param
// url image (asset,network)
// 2. Fitbox = cover
// 3. width height
// Nếu không có url => not image (Placehoder image)
// Nếu network ImageCaccheBuilder
// Loading khi đang load ảnh
enum RkImageType {
  SVG,
  IMAGE,
  NOTIMAGE,
}

enum RkImageUrlType {
  NETWORK,
  ASSET,
  FILE,
  ICON,
  IMAGE_CIRCLE,
}

class RkImage extends StatelessWidget {
  RkImage(
    this.urlImage, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);
  RkImage.file(
    File? this.file, {
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  RkImage.icon(
    IconData this.icon, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color = ColorResources.BLACK,
    this.size,
  }) : super(key: key);
  String? urlImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  File? file;
  IconData? icon;
  Color? color;
  double? size;
  double? borderRadius;
  Color? borderColor;

  RkImageType checkImageType(String url) {
    if (RkValidate.nullOrEmpty(url) && RkValidate.nullOrEmpty(file) && RkValidate.nullOrEmpty(icon)) {
      return RkImageType.NOTIMAGE;
    }
    if (url.endsWith(".svg")) {
      return RkImageType.SVG;
    }
    return RkImageType.IMAGE;
  }

  RkImageUrlType checkImageUrlType(String url) {
    if (RkValidate.nullOrEmpty(url)) {
      if (icon != null) {
        return RkImageUrlType.ICON;
      }
      return RkImageUrlType.FILE;
    }
    if (url.startsWith('http') || url.startsWith('https')) {
      return RkImageUrlType.NETWORK;
    } else if (url.startsWith('assets/')) {
      return RkImageUrlType.ASSET;
    } else if (icon != null) {
      if (icon!.fontFamily.toString().toLowerCase().contains('CupertinoIcons'.toLowerCase()) || icon!.fontFamily.toString().toLowerCase().contains('MaterialIcons'.toLowerCase())) {
        return RkImageUrlType.ICON;
      }
      return RkImageUrlType.FILE;
    }
    return RkImageUrlType.FILE;
  }

  Widget imageTypeWidget(String urlImage, RkImageType imageType, RkImageUrlType imageUrlType) {
    // print(imageUrlType);
    if (imageType == RkImageType.IMAGE) {
      if (imageUrlType == RkImageUrlType.NETWORK) {
        // final imageProvider = ResizeImage.resizeIfNeeded(
        //   400,
        //   400,
        //   CachedNetworkImageProvider(
        //     urlImage,
        //   ),
        // );
        //
        // imageProvider.obtainCacheStatus(configuration: ImageConfiguration.empty).then(
        //   (value) {
        //     imageProvider.evict();
        //   },
        // );
        late final imageProvider = CachedNetworkImageProvider(
          urlImage,
          cacheKey: urlImage,
          // cacheManager: CustomCacheManager.instance,
        );

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child:
              // Image(
              //   image: ResizeImage(
              //     imageProvider,
              //     width: RkValidate.nullOrEmpty(width) ? width!.toInt() : 600,
              //     height: RkValidate.nullOrEmpty(height) ? height!.toInt() : 600,
              //     policy: ResizeImagePolicy.fit,
              //   ),
              //   fit: fit,
              // ),
              CachedNetworkImage(
            useOldImageOnUrlChange: true,
            imageUrl:
                // "https://api.daugiadgv.vn/storage/asset/image/20240619070346190-B%E1%BB%99%20s%C6%B0u%20t%E1%BA%ADp%20c%E1%BB%95%20v%E1%BA%ADt%20%C4%91%E1%BA%B9p%20ch%C6%B0a%20t%E1%BB%ABng%20th%E1%BA%A5y.jpg",
                urlImage,
            fit: fit,
            // imageBuilder: (context, imageProvider) => Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(borderRadius ?? 0),
            //     image: DecorationImage(
            //       image: imageProvider,
            //       fit: fit,
            //     ),
            //   ),
            // ),
            // imageBuilder: (_, imageProvider) => Image(
            //   image: CachedNetworkImageProvider(urlImage),
            //   fit: fit,
            // ),
            placeholder: (context, url) => Center(
              child: SizedBox(
                // width: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                // height: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                width: RkDimensions.ONE_UNIT_FONT * 30,
                height: RkDimensions.ONE_UNIT_FONT * 30,
                child: CircularProgressIndicator(
                  color: ColorResources.PROCESS_START,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            cacheManager: CustomCacheManager.instance,
            // maxHeightDiskCache: 400,
            // maxWidthDiskCache: 400,
            memCacheHeight: 800,
            memCacheWidth: 800,

            // ),
          ),
        );
      } else if (imageUrlType == RkImageUrlType.ASSET) {
        return Container(
          height: height,
          width: width,
          child: Image.asset(
            urlImage,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        );
      } else if (imageUrlType == RkImageUrlType.FILE) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: Container(
            height: height,
            width: width,
            child: Image.file(
              file!,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        );
      } else if (imageUrlType == RkImageUrlType.ICON) {
        return Container(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
            size: size ?? RkDimensions.ONE_UNIT_SIZE * 45,
          ),
        );
      }
    }

    if (imageType == RkImageType.SVG) {
      if (imageUrlType == RkImageUrlType.NETWORK) {
        return Container(
          height: height,
          width: width,
          child: SvgPicture.network(
            urlImage,
            fit: fit!,
            placeholderBuilder: (BuildContext context) => SizedBox(
              child: Center(
                child: SizedBox(
                  width: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                  height: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                  child: CircularProgressIndicator(
                    color: ColorResources.PROCESS_START,
                  ),
                ),
              ),
            ),
            color: color,
          ),
        );
      } else if (imageUrlType == RkImageUrlType.ASSET) {
        return Container(
          height: height,
          width: width,
          child: SvgPicture.asset(
            urlImage,
            fit: fit!,
            placeholderBuilder: (BuildContext context) => SizedBox(
              child: Center(
                child: SizedBox(
                  width: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                  height: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                  child: CircularProgressIndicator(
                    color: ColorResources.PROCESS_START,
                  ),
                ),
              ),
            ),
            color: color,
          ),
        );
      } else if (imageUrlType == RkImageUrlType.FILE) {
        return Expanded(
          child: Container(
            height: height,
            width: width,
            child: SvgPicture.file(
              file!,
              fit: fit!,
              placeholderBuilder: (BuildContext context) => SizedBox(
                child: Center(
                  child: SizedBox(
                    width: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                    height: !RkValidate.nullOrEmpty(width) ? width! / 2 : RkDimensions.FONT_SIZE_H5,
                    child: CircularProgressIndicator(
                      color: ColorResources.PROCESS_START,
                    ),
                  ),
                ),
              ),
              color: color,
            ),
          ),
        );
      } else if (imageUrlType == RkImageUrlType.ICON) {
        return Container(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
          ),
        );
      }
    }

    if (imageType == RkImageType.NOTIMAGE) {
      return Container(
        height: height ?? RkDimensions.ONE_UNIT_SIZE * 50,
        width: width ?? RkDimensions.ONE_UNIT_SIZE * 50,
        child: Image.asset(
          ImagesPath.placeholder,
          fit: fit,
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final imageType = checkImageType(urlImage.toString());
    final imageUrlType = checkImageUrlType(urlImage.toString());
    // print(imageUrlType);
    return Container(
      width: width,
      height: height,
      child: imageTypeWidget(
        urlImage.toString(),
        imageType,
        imageUrlType,
      ),
    );
  }
}

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(seconds: 5),
      maxNrOfCacheObjects: 10,
    ),
  );
}
