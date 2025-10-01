import 'dart:math';

import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../base_widget/background/background.dart';
import '../../base_widget/rk_screen.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = DateTime.now().day - 1;

    late DateTime selectedDate = DateTime.now();

    /// Get the current date
    DateTime now = DateTime.now();
    late DateTime firstDayOfMonth;
    late DateTime lastDayOfMonth;
    firstDayOfMonth = DateTime(now.year, now.month, 1);
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        RefreshController refreshController = RefreshController();
        return RkScreen(
          isDisplayDesirePaddingTop: false,
          isSingleChildScrollView: false,
          background: BackgroundDefault(),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff181F21),
                    Color(0xff1A1A1A),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(lastDayOfMonth.day, (index) {
                            final currentDate = firstDayOfMonth.add(Duration(days: index));
                            final dayName = DateFormat('E').format(currentDate);
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    width: 57,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index ? const Color(0xffE03B1A) : const Color(0xFF2A2F30),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(dayName.substring(0, 3),
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Text('${index + 1}', style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: index == 2 ? const Color(0xffE03B1A) : const Color(0xFF2A2F30),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  '10:30 AM',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomPaint(
                        painter: CurvePainter(),
                        child: Container(height: 170),
                      ),
                      Wrap(
                        spacing: 12,
                        children: List.generate(
                          100,
                          (index) {
                            final randomColor = getRandomColor([const Color(0xFF2A2F30), Colors.white, const Color(0xffE03B1A)]);
                            return Icon(
                              Icons.chair,
                              color: randomColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text("Available", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text("Taken", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffE03B1A),
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text("Selected", style: TextStyle(color: Color(0xffE03B1A))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        height: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: const Color(0xff292F30), borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  "SmartCinema Sky Park",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Text(
                              "Mykola Ovodova 51,Vinnitsa, Vinnitsa region,2100",
                              style: TextStyle(color: Colors.grey),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  elevation: 0, fixedSize: const Size(230, 50), backgroundColor: const Color(0xffE03B1A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                "Buy Ticket  \$48.00 ",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Stack(
          //   children: [
          //     Positioned.fill(
          //       child: RkImage(
          //         ImagesPath.img_bg_tree,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Positioned.fill(
          //       top: 50,
          //       child: GridView.count(
          //         crossAxisCount: 2,
          //         children: List.generate(6, (index) {
          //           return GestureDetector(
          //             onTap: () {
          //               log("message");
          //             },
          //             child: Center(
          //               child: RkImage(
          //                 ImagesPath.ic_file,
          //                 height: 50,
          //                 width: 50,
          //                 color: ColorResources.WHITE,
          //               ),
          //             ),
          //           );
          //         }),
          //       ),
          //     ),
          //   ],
          // ),
        );
      },
    );
  }

  Color getRandomColor(List<Color> colors) {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = const Color(0xffE03B1A);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 4, size.height / 5);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 5);
    var endPoint = Offset(size.width, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, endPoint.dx, endPoint.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
