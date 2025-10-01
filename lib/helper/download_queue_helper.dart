import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:template/base_widget/rk_text.dart';

class DownloadQueueHelper {
  // static final DownloadQueueHelper _instance = DownloadQueueHelper._internal();
  //
  // // static RxList<QueueReportFileDownload> _queue = <QueueReportFileDownload>[].obs;
  //
  // static int limitConcurrentDownloading = 3;
  // static RxSet<String> _idsCurrentDownloading = <String>{}.obs;
  //
  // factory DownloadQueueHelper() {
  //   return _instance;
  // }
  //
  // DownloadQueueHelper._internal();
  //
  // RxList get queue {
  //   return _queue;
  // }
  //
  // RxInt get totalQueue {
  //   return _queue.length.obs;
  // }
  //
  // RxInt get totalDone {
  //   int totalDone = 0;
  //   for (var i = 0; i < _queue.length; i += 1) {
  //     if (_queue[i].isCompleteDownloaded.value == true || _queue[i].isErrorDownloaded.value == true) {
  //       totalDone += 1;
  //     }
  //   }
  //   return totalDone.obs;
  // }
  //
  // Future<void> checkNetwork() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     Get.snackbar("notification".tr, "has_warning_download_via_mobile".tr);
  //   }
  // }
  //
  // void push(QueueReportFileDownload queueReportFileDownload) async {
  //   bool canAddToQueue = true;
  //   int qLength = _queue.length;
  //   for (var i = 0; i < qLength; i += 1) {
  //     if (i >= 0 && i < qLength) {
  //       if (_queue[i].report_name == queueReportFileDownload.report_name) {
  //         if (_queue[i].isWaitingToDownload.value == true || _queue[i].isDownloading.value == true) {
  //           canAddToQueue = false;
  //         }
  //       }
  //     }
  //   }
  //   if (canAddToQueue == true) {
  //     _queue.add(queueReportFileDownload);
  //     // _queue.insert(0, queueReportFileDownload);
  //     print('Item ${queueReportFileDownload.report_name} was add to queue');
  //     _queue.refresh();
  //   }
  //   checkQueueWhenHasDownloadComplete();
  // }
  //
  // void pop(QueueReportFileDownload queueReportFileDownload) async {
  //   int qLength = _queue.length;
  //   for (var i = 0; i < qLength; i += 1) {
  //     if (i >= 0 && i < qLength) {
  //       if (_queue[i].report_name == queueReportFileDownload.report_name) {
  //         _queue.removeAt(i);
  //         qLength = _queue.length;
  //         _queue.refresh();
  //       }
  //     }
  //   }
  // }
  //
  // void downloadFileError(String id) async {
  //   _idsCurrentDownloading.remove(id);
  //   _idsCurrentDownloading.refresh();
  //   _queue.refresh();
  //   // Cho nay can start download moi neu trong queue con item khac
  //   checkQueueWhenHasDownloadError();
  // }
  //
  // void downloadFileComplete(String id) async {
  //   _idsCurrentDownloading.remove(id);
  //   _idsCurrentDownloading.refresh();
  //   _queue.refresh();
  //   // Cho nay can start download moi neu trong queue con item khac
  //   checkQueueWhenHasDownloadComplete();
  // }
  //
  // void checkQueueWhenHasDownloadError() async {
  //   // if(_idsCurrentDownloading.length >= limitConcurrentDownloading) return;
  //   int qLength = _queue.length;
  //   for (var i = 0; i < qLength; i += 1) {
  //     if (_idsCurrentDownloading.length >= limitConcurrentDownloading) break;
  //     if (i >= 0 && i < qLength) {
  //       if (_queue[i].isWaitingToDownload.value == true) {
  //         _queue[i].downloadFile();
  //         _idsCurrentDownloading.add(_queue[i].report_name!);
  //         _idsCurrentDownloading.refresh();
  //         checkNetwork();
  //       }
  //     }
  //   }
  // }
  //
  // void checkQueueWhenHasDownloadComplete() async {
  //   // if(_idsCurrentDownloading.length >= limitConcurrentDownloading) return;
  //   int qLength = _queue.length;
  //   for (var i = 0; i < qLength; i += 1) {
  //     if (_idsCurrentDownloading.length >= limitConcurrentDownloading) break;
  //     if (i >= 0 && i < qLength) {
  //       if (_queue[i].isWaitingToDownload.value == true) {
  //         _queue[i].downloadFile();
  //         _idsCurrentDownloading.add(_queue[i].report_name!);
  //         _idsCurrentDownloading.refresh();
  //         checkNetwork();
  //       }
  //     }
  //   }
  // }
  //
  // Future dispose() async {
  //   // stop();
  // }
  //
  // clear() {
  //   _queue.clear();
  // }
  //
  // refresh() {
  //   _queue.refresh();
  // }
  //
  // Widget downloadDialog() {
  //   double currentHeight = Get.height * 0.8;
  //   double currentWidth = Get.width * 0.6;
  //   return GestureDetector(
  //     onTap: () {
  //       Get.back();
  //     },
  //     child: Dialog(
  //       backgroundColor: Colors.transparent,
  //       elevation: 0,
  //       child: Center(
  //         child: Container(
  //           height: currentHeight,
  //           width: currentWidth,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(15.0),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.3),
  //                 spreadRadius: 1,
  //                 blurRadius: 5,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 // color: Colors.red,
  //                 height: 30.0,
  //                 width: currentWidth,
  //                 child: Center(
  //                   child: Stack(
  //                     children: [
  //                       Row(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           RkText(
  //                             "downloading".tr,
  //                           ),
  //                           SizedBox(
  //                             width: 10.0,
  //                           ),
  //                           Obx(
  //                             () => RkText(
  //                               "$totalDone/$totalQueue",
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Positioned(
  //                         top: 0,
  //                         right: 12.0,
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             Get.back();
  //                           },
  //                           child: Container(
  //                             height: 15.0,
  //                             width: 15.0,
  //                             child: Icon(
  //                               Icons.close_rounded,
  //                               size: 20.0,
  //                               color: Colors.black87,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 height: currentHeight - 30.0,
  //                 width: currentWidth,
  //                 child: Obx(
  //                   () => ListView.builder(
  //                     itemCount: _queue.length,
  //                     // physics: BouncingScrollPhysics(),
  //                     scrollDirection: Axis.vertical,
  //                     shrinkWrap: true,
  //                     itemBuilder: (context, index) {
  //                       return _buildItemDownload(_queue.length - 1 - index, _queue[_queue.length - 1 - index], currentWidth);
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildItemDownload(int index, QueueReportFileDownload queueReportFileDownload, double currentWidth) {
  //   double widthMainColumn = currentWidth - 60.0 - 10.0;
  //   return Container(
  //     width: currentWidth,
  //     height: 40.0,
  //     // color: Colors.red,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: widthMainColumn,
  //           height: 6.0,
  //           // color: Colors.white,
  //           child: Center(
  //             child: index < _queue.length - 1
  //                 ? Divider(
  //                     thickness: 0.25,
  //                     color: Colors.grey,
  //                   )
  //                 : SizedBox(),
  //           ),
  //         ),
  //         Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               width: 15.0,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: widthMainColumn,
  //                     // alignment: Alignment.center,
  //                     child: RkText(
  //                       '${index + 1}. ${queueReportFileDownload.report_name}',
  //                       maxLine: 1,
  //                       textOverflow: TextOverflow.ellipsis,
  //                       // color: Colors.black87,
  //
  //                       textAlign: TextAlign.left,
  //                     ),
  //                   ),
  //                   Obx(
  //                     () => _buildStatusLoadingBar(queueReportFileDownload, widthMainColumn),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: 5.0,
  //             ),
  //             Container(
  //               width: 34.0,
  //               height: 34.0,
  //               child: Center(
  //                 child: _buildStatusIcon(queueReportFileDownload),
  //               ),
  //             ),
  //             SizedBox(
  //               width: 2.0,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildStatusLoadingBar(QueueReportFileDownload queueReportFileDownload, double widthMainColumn) {
  //   String text = '';
  //   Color color;
  //   if (queueReportFileDownload.isWaitingToDownload.value == true) {
  //     text = 'waiting_download'.tr;
  //     color = Colors.orange;
  //   }
  //   if (queueReportFileDownload.isDownloading.value == true) {
  //     return LinearPercentIndicator(
  //       padding: EdgeInsets.all(0),
  //       width: widthMainColumn,
  //       lineHeight: 14.0,
  //       percent: queueReportFileDownload.percentDownloading.value ?? 0.0,
  //       backgroundColor: Colors.grey.shade300,
  //       progressColor: Colors.orangeAccent,
  //       barRadius: Radius.circular(14),
  //     );
  //   }
  //   if (queueReportFileDownload.isCompleteDownloaded.value == true) {
  //     text = 'download_completed'.tr;
  //     color = Colors.green;
  //   }
  //   if (queueReportFileDownload.isErrorDownloaded.value == true) {
  //     text = 'download_error'.tr;
  //     color = Colors.red;
  //   }
  //   return RkText(
  //     text,
  //     maxLine: 1,
  //     textOverflow: TextOverflow.ellipsis,
  //     textAlign: TextAlign.left,
  //   );
  // }
  //
  // Widget _buildStatusIcon(QueueReportFileDownload queueReportFileDownload) {
  //   IconData? iconData;
  //   Color? color;
  //   if (queueReportFileDownload.isWaitingToDownload.value == true) {
  //     iconData = Icons.more_horiz_rounded;
  //     color = Colors.orange;
  //   }
  //   if (queueReportFileDownload.isDownloading.value == true) {
  //     iconData = Icons.downloading;
  //     color = Colors.blueAccent;
  //   }
  //   if (queueReportFileDownload.isCompleteDownloaded.value == true) {
  //     iconData = Icons.download_done_rounded;
  //     color = Colors.green;
  //   }
  //   if (queueReportFileDownload.isErrorDownloaded.value == true) {
  //     iconData = Icons.error_outline_rounded;
  //     color = Colors.red;
  //   }
  //   return Icon(
  //     iconData,
  //     size: 15.0,
  //     color: color,
  //   );
  // }
}
