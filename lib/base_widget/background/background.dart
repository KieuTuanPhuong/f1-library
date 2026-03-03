import 'package:flutter/material.dart';
import 'package:template/utils/color_resources.dart';

import '../../utils/images_path.dart';
import '../rk_image.dart';

class BackgroundDefault extends StatelessWidget {
  const BackgroundDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: ColorResources.BACKGROUND_BLACK,
        body: Stack(children: [
          // Positioned.fill(
          //   child: DgvImage(
          //     ImagesPath.img_bg,
          //   ),
          // ),
        ]),
      ),
    );
  }
}
