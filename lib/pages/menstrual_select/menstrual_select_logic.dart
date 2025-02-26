import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db_menstrual/db_menstrual.dart';
import '../../db_menstrual/menstrual_entity.dart';

class MenstrualSelectLogic extends GetxController {
  List<DateTime> selectedDates = [];

  String content = '';
  var rate = 1.0;

  void commit() async {
    if (selectedDates.length != 2) {
      Fluttertoast.showToast(msg: 'Please select the date');
      return;
    }
    if (rate < 1) {
      Fluttertoast.showToast(msg: 'Please rate your menstrual period');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter your menstrual period');
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('menstrualSelect', [
      DateTime(selectedDates.first.year, selectedDates.first.month,
              selectedDates.first.day)
          .toIso8601String(),
      DateTime(selectedDates.last.year, selectedDates.last.month,
              selectedDates.last.day, 23, 59, 59)
          .toIso8601String()
    ]);
    DBMenstrual dbMenstrual = Get.find();
    for (var i = 0;
        i <
            DateTime(selectedDates.last.year, selectedDates.last.month,
                    selectedDates.last.day, 23, 59, 59)
                .difference(DateTime(selectedDates.first.year,
                    selectedDates.first.month, selectedDates.first.day))
                .inDays;
        i++) {
      final entity = MenstrualEntity(
          id: 0,
          createdTime: DateTime.now(),
          content: DateTime(selectedDates.first.year, selectedDates.first.month,
                  selectedDates.first.day)
              .add(Duration(days: i))
              .toIso8601String());
      await dbMenstrual.insertMenstrual(entity);
    }
    Get.offAllNamed('/tab');
  }
}
