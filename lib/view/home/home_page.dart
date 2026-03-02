import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/base_widget/rk_image.dart';
import 'package:template/base_widget/rk_screen.dart';
import 'package:template/helper/rk_dimensions.dart';
import 'package:template/helper/rk_number.dart';
import 'package:template/utils/color_resources.dart';

import '../../base_widget/rk_text.dart';
import '../../utils/fonts.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController value) {
        return PopScope(
          child: RkScreen(
            body: SingleChildScrollView(
              child: Container(
                color: Colors.red,
                height: 1000,
                child: ListView.builder(
                  itemCount: controller.menu.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('Hello');
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: index != 2 ? Colors.blue : Colors.red,
                        ),
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // spacing: 10,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RkText(
                                    controller.menu[index]['title'],
                                  ),
                                  Expanded(
                                    child: RkText(
                                      controller.menu[index]['description'],
                                      maxLine: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            RkText(
                              'Hello',
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
