import 'package:flutter/material.dart';

class PMAppUtil {
  static keyboardDis(
    BuildContext context,
  ) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static String numFormat(int number) {
    if (number < 10) {
      return "0$number";
    }
    return "$number";
  }



  static timeCaculate(int time1, int timeBig, {bool isYear = false}) {
    if (timeBig <= time1) {
      return "0";
    }
    final nubber = (timeBig - time1) / 1000;
    if (isYear) {
      final result = nubber / 24 / 60 / 60 / 365;
      return result <= 1 ? "0 " : result.toStringAsFixed(0);
    } else {
      final result = nubber / 24 / 60 / 60;
      return result <= 1 ? "0" : result.toStringAsFixed(0);
    }
  }

  static String formatDateWithoutHour({
    required DateTime dateTime,
  }) {
    return "${dateTime.year}-${numFormat(dateTime.month)}-${numFormat(dateTime.day)}";
  }

  static String formatDate({
    required DateTime dateTime,
  }) {
    return "${dateTime.year}-${numFormat(dateTime.month)}-${numFormat(dateTime.day)} ${dateTime.hour}:${numFormat(dateTime.minute)}:${numFormat(dateTime.second)}";
  }
}
