import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/images_path.dart';
import '../rk_image.dart';

class BackgroundProfile extends StatelessWidget {
  const BackgroundProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          // Positioned(
          //   child: DgvImage(
          //     ImagesPath.background_gradient,
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //   ),
          // ),
          // CustomPaint(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: ExactAssetImage(ImagesPath.background_app_bar),
          //       ),
          //     ),
          //   ),
          //   painter: HeaderCurvedContainer(),
          // ),
          // Positioned(
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height * 0.25,
          //     child: DgvImage(ImagesPath.img_bg_app_bar),
          //   ),
          // ),
        ]),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff555555);

    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    // canvas.drawImage(
    //   Image(image: image)
    //   Offset(0.0, 0.0),
    //   paint,
    // );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
