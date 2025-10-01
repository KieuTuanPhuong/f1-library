import 'package:get/get.dart';

import '../../../data/provider/provider.dart';

class NotificationSettingsController extends GetxController {
  final Provider provider = Provider();
  List multipleSelected = [];
  bool isSelectAll = false;

  List checkListItems = [
    // {
    //   "id": 0,
    //   "value": false,
    //   "title": "Tất cả",
    // },
    {
      "id": 1,
      "value": false,
      "title": "Xuất bản/gia hạn tin thành công",
    },
    {
      "id": 2,
      "value": false,
      "title": "Tin được chỉnh sửa/Hạ/Xóa",
    },
    {
      "id": 3,
      "value": false,
      "title": "Tin được duyệt / không được duyệt",
    },
    {
      "id": 4,
      "value": false,
      "title": "Thông báo hệ thống",
    },
    {
      "id": 5,
      "value": false,
      "title": "Khác",
    },
  ];
  List checkListItems1 = [
    {
      "id": 0,
      "value": true,
      "title": "Nhận thông báo qua email",
    },
    {
      "id": 1,
      "value": false,
      "title": "Không nhận thông báo qua email",
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
