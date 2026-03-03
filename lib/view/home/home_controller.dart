import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    // isLogin = sl.get<SharedPreferenceHelper>().getLogin;
    // print("hhhhhhhhh $isLogin");
    // onCheckLogin();
  }

  List menu = [
    {
      'title': 'Drivers',
      'description': 'View driver information',
      'icon': Icons.person_outline,
    },
    {
      'title': 'Teams',
      'description': 'View constructor information',
      'icon': Icons.groups_outlined,
    },
    {
      'title': 'Seasons',
      'description': 'Explore past and current seasons',
      'icon': Icons.history_edu_outlined,
    },
    {
      'title': 'Results',
      'description': 'Check race results',
      'icon': Icons.flag_outlined,
    },
    {
      'title': 'Standings',
      'description': 'View driver and team standings',
      'icon': Icons.leaderboard_outlined,
    },
    {
      'title': 'Circuits',
      'description': 'Discover race tracks details',
      'icon': Icons.map_outlined,
    },
    {
      'title': 'Races',
      'description': 'Upcoming and past races',
      'icon': Icons.sports_motorsports_outlined,
    },
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void onClose() {
    super.onClose();
  }
}
