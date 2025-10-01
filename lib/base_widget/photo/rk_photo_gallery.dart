import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../helper/rk_dimensions.dart';
import '../../helper/rk_validate.dart';
import '../../utils/app_constants.dart';

class RkPhotoGallery extends StatefulWidget {
  final int initialIndex;
  // final List<Photo> images;
  final List<String> images;
  final PageController pageController;

  RkPhotoGallery({required this.images, required this.initialIndex}) : pageController = PageController(initialPage: initialIndex);

  @override
  State<RkPhotoGallery> createState() => _RkPhotoGalleryState();
}

class _RkPhotoGalleryState extends State<RkPhotoGallery> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            if (!RkValidate.checkNetworkUrl(widget.images[index])) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(File(widget.images[index])),
                // heroAttributes: PhotoViewHeroAttributes(tag: widget.images[index].photoDate),
              );
            } else {
              return PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(
                    // BASE_URL_IMAGE +
                    widget.images[index]),
                // heroAttributes: PhotoViewHeroAttributes(tag: widget.images[index].photoDate),
              );
            }
          },
          itemCount: widget.images.length,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
              ),
            ),
          ),
          pageController: widget.pageController,
          onPageChanged: onPageChanged,
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
        //     child: Padding(
        //       padding: EdgeInsets.all(RkDimensions.SPACE_SIZE_3X),
        //       child: RkText(
        //         DateFormat('HH:mm | dd/MM/yyyy').format(RkDate.parse(widget.images[currentIndex].photoDate)),
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(
              top: RkDimensions.SPACE_SIZE_6X,
            ),
            alignment: Alignment.centerLeft,
            width: RkDimensions.screenSize.width * 0.125,
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
