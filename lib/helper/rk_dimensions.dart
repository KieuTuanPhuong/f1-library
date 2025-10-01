import 'dart:ui';

import 'package:template/helper/rk_size.dart';

mixin RkDimensions {
  // Max size safe area default without top and bottom
  static Size screenSize = RkSize.size;

  // Divide screen to 1000 unit, get one unit to make base
  static double ONE_UNIT_SIZE = RkSize.getFontSize();

  static double ONE_UNIT_FONT = ONE_UNIT_SIZE * 1.475;

  // Font size text and icon
  static double FONT_SIZE_SPAN_SMALL_EXTRA = 10.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_SMALL = 12.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN = 14.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_MEDIUM = 16.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_MEDIUM_X = 18.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_MEDIUM_XX = 19.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_LARGE = 20.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_LARGE_X = 21.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_SPAN_LARGE_XX = 22.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H6 = 25.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H6_MEDIUM = 28.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H5 = 30.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H4X = 32.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H4 = 35.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H3 = 40.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H2 = 45.0 * ONE_UNIT_FONT;
  static double FONT_SIZE_H1 = 50.0 * ONE_UNIT_FONT;

  // Padding , Margin
  static double SPACE_SIZE_0X5 = 7.5 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_1X = 10.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_1X5 = 12.5 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_2X = 15.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_2X5 = 17.5 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_3X = 20.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_3X5 = 22.5 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_4X = 25.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_5X = 30.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_5X5 = 35.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_6X = 40.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_7X = 50.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_8X = 60.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_8X5 = 70.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_10X = 80.0 * ONE_UNIT_SIZE;
  static double SPACE_SIZE_12X = 100.0 * ONE_UNIT_SIZE;

  // BORDER RADIUS
  static double BORDER_RADIUS_1X = 5.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_2X = 7.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_3X = 10.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_4X = 15.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_5X = 25.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_6X = 30.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_7X = 50.0 * ONE_UNIT_SIZE;
  static double BORDER_RADIUS_8X = 60.0 * ONE_UNIT_SIZE;

  //BLUR RADIUS
  static double BLUR_RADIUS_1X = 5 * ONE_UNIT_SIZE;
  static double BLUR_RADIUS_2X = 10 * ONE_UNIT_SIZE;
  static double BLUR_RADIUS_3X = 15 * ONE_UNIT_SIZE;
  static double BLUR_RADIUS_4X = 20 * ONE_UNIT_SIZE;
  static double BLUR_RADIUS_5X = 25 * ONE_UNIT_SIZE; //spread Radius
  static double SPREAD_RADIUS_1X = 0.05 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_2X = 0.1 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_3X = 0.2 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_4X = 0.4 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_5X = 0.6 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_6X = 1 * ONE_UNIT_SIZE;
  static double SPREAD_RADIUS_7X = 2 * ONE_UNIT_SIZE;
}
