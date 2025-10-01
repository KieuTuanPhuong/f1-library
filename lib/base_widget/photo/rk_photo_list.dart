import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template/base_widget/background/background.dart';

import '../../helper/rk_dimensions.dart';
import '../../helper/rk_validate.dart';
import '../../utils/app_constants.dart';

import '../rk_app_bar.dart';
import '../rk_image.dart';
import '../rk_screen.dart';
import 'rk_photo_gallery.dart';

class RkPhotoList extends StatelessWidget {
  // final List<Photo> images;
  final List<String> images;

  const RkPhotoList({required this.images});

  @override
  Widget build(BuildContext context) {
    return RkScreen(
      background: const BackgroundDefault(),
      appBar: RkAppBar(
        title: 'all_images',
      ),
      isDisplayDesirePaddingTop: false,
      body: Container(
        padding: EdgeInsets.all(RkDimensions.ONE_UNIT_SIZE * 4),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          mainAxisSpacing: RkDimensions.ONE_UNIT_SIZE * 4,
          crossAxisSpacing: RkDimensions.ONE_UNIT_SIZE * 4,
          children: List.generate(images.length, (index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RkPhotoGallery(
                        images: images,
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Hero(
                    tag: images[index],
                    child: Stack(
                      children: [
                        if (!RkValidate.checkNetworkUrl(images[index])) RkImage.file(File(images[index])) else RkImage(BASE_URL_IMAGE + images[index]),
                        // Positioned(
                        //   top: 0,
                        //   left: 0,
                        //   right: 0,
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(vertical: 4 * RkDimensions.ONE_UNIT_SIZE),
                        //     decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
                        //     child: Center(
                        //       child: RkText(
                        //         DateFormat('HH:mm').format(RkDate.parse(images[index].photoDate)),
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //   bottom: 0,
                        //   left: 0,
                        //   right: 0,
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(vertical: 4 * RkDimensions.ONE_UNIT_SIZE),
                        //     decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
                        //     child: Center(
                        //       child: RkText(
                        //         DateFormat('dd/MM/yyyy').format(RkDate.parse(images[index].photoDate)),
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    )));
          }),
        ),
      ),
    );
  }
}
