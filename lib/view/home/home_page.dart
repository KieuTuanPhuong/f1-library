import 'dart:io';
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
            isSingleChildScrollView: false,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RkText(
                              "UPCOMING EVENT",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color:
                                    ColorResources.LIGHT_GRAY.withOpacity(0.8),
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 1.5,
                                color: ColorResources.STROKE.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              RkImage.file(
                                File(
                                    '/Users/macbook/.gemini/antigravity/brain/a8660599-190c-4926-b74a-169f2a202232/spa_francorchamps_track_1772521975228.png'),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.8),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: ColorResources.RACING_RED,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        RkText(
                                          "ROUND 12 • SPA-FRANCORCHAMPS",
                                          style: const TextStyle(
                                            color: ColorResources.RACING_RED,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    RkText(
                                      "Belgian Grand Prix",
                                      style: const TextStyle(
                                        color: ColorResources.WHITE,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    RkText(
                                      "JUL 26-28",
                                      style: TextStyle(
                                        color: ColorResources.WHITE
                                            .withOpacity(0.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = controller.menu[index];
                        return GestureDetector(
                          onTap: () {
                            debugPrint('Tapped: ${item['title']}');
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: ColorResources.BACKGROUND_BLACK,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ColorResources.STROKE.withOpacity(0.5),
                                  ColorResources.CARBON_BLACK,
                                ],
                                stops: const [0.0, 0.5],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ColorResources.STROKE.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Left racing red border
                                Container(
                                  width: 6,
                                  color: ColorResources.RACING_RED,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 16, 16, 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        item['icon'],
                                        color: ColorResources.RACING_RED,
                                        size: 30,
                                      ),
                                      const Spacer(),
                                      RkText(
                                        item['title'],
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800,
                                          color: ColorResources.WHITE,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      RkText(
                                        item['description'],
                                        maxLine: 1,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: ColorResources.LIGHT_GRAY
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: controller.menu.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
