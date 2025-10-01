import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import '../../../utils/style.dart';
import '../../helper/rk_date.dart';
import '../../helper/rk_dimensions.dart';
import '../rk_text.dart';

class RkPhotoView extends StatelessWidget {
  final ImageProvider imageProvider;
  final String photoDate;

  const RkPhotoView({required this.imageProvider, required this.photoDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      child: Stack(
        children: [
          PhotoView(
            imageProvider: imageProvider,
            heroAttributes: PhotoViewHeroAttributes(tag: photoDate),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Padding(
                padding: EdgeInsets.all(RkDimensions.SPACE_SIZE_3X),
                child: RkText(
                  DateFormat('HH:mm | dd/MM/yyyy').format(RkDate.parse(photoDate)),
                ),
              ),
            ),
          ),
          Row(
            children: [
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
          ),
        ],
      ),
    );
  }
}
