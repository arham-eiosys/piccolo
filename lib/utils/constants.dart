import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Constants {
  static const bool kLog_enabled = true;
  static String appVersion = '1.0.0';

  static int textEditingMaxLength = 50;

  static Map<String, dynamic> requestedOTPCounter = {
    'count': 0,
    'timestamp': DateTime.now().add(const Duration(minutes: 30)).toString(),
  };

  static Future<void> checkAndResetRequestedObject() {
    if (requestedOTPCounter['count'] as int > 2) {
      if (DateTime.parse(requestedOTPCounter['timestamp'].toString())
              .difference(DateTime.now())
              .inMinutes >
          30) {
        requestedOTPCounter.update('count', (value) => 0);
        requestedOTPCounter.update(
            'timestamp',
            (value) =>
                DateTime.now().add(const Duration(minutes: 30)).toString());
      }
    }
    return Future.value();
  }

  static void printLog(dynamic data) {
    if (kLog_enabled) {
      final now = DateTime.now().toUtc().toString().split(' ').last;
      debugPrint('[$now] [Biggest Supplier] ${data.toString()}');
    }
  }
}
