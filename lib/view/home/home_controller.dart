import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:template/data/api_endpoint/api_endpoint.dart';
import 'package:template/data/model/race/race_info_response.dart';
import 'package:template/data/provider/provider.dart';

class HomeController extends GetxController {
  Race? nextRace;
  bool isLoadingNextRace = false;
  String? trackImageUrl;

  @override
  void onInit() async {
    super.onInit();
    getNextRace();
  }

  Future<void> getTrackImage(String? wikiUrl) async {
    if (wikiUrl == null || wikiUrl.isEmpty) return;

    final uri = Uri.parse(wikiUrl);
    final title = uri.pathSegments.last;

    await Provider<dynamic>().autoPrediction(
      endPoint: APIEndPoint.WIKIPEDIA_IMAGE(title),
      onSuccess: (data) {
        try {
          if (data['thumbnail'] != null) {
            trackImageUrl = data['thumbnail']['source'];
            update();
          }
        } catch (e) {
          print('Error parsing Wikipedia response: $e');
        }
      },
      onError: (error) {
        print('Error fetching Wikipedia image: $error');
      },
    );
  }

  Future<void> getNextRace() async {
    isLoadingNextRace = true;
    update();
    await Provider<RaceInfoResponse>().get(
      endPoint: APIEndPoint.F1_CURRENT_NEXT_RACE_INFO,
      onSuccess: (data) {
        final response = RaceInfoResponse.fromJson(data);
        if (response.race != null && response.race!.isNotEmpty) {
          nextRace = response.race!.first;
          getTrackImage(nextRace?.circuit?.url);
        }
        isLoadingNextRace = false;
        update();
      },
      onError: (error) {
        isLoadingNextRace = false;
        update();
      },
    );
  }

  String get getRaceDateRange {
    if (nextRace == null || nextRace!.schedule == null) return '';
    final startDateStr =
        nextRace!.schedule!.fp1?.date ?? nextRace!.schedule!.race?.date;
    final endDateStr = nextRace!.schedule!.race?.date;

    if (startDateStr == null || endDateStr == null) return '';

    final startDate = DateTime.parse(startDateStr);
    final endDate = DateTime.parse(endDateStr);

    final startDay = startDate.day.toString().padLeft(2, '0');
    final endDay = endDate.day.toString().padLeft(2, '0');
    final month = DateFormat('MMM').format(endDate).toUpperCase();

    if (startDate.month == endDate.month) {
      if (startDay == endDay) {
        return '$month $endDay';
      }
      return '$month $startDay-$endDay';
    } else {
      final startMonth = DateFormat('MMM').format(startDate).toUpperCase();
      return '$startMonth $startDay - $month $endDay';
    }
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
