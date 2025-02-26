import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menstrual_record/db_menstrual/db_menstrual.dart';
import 'package:menstrual_record/db_menstrual/menstrual_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db_menstrual/menstrual_cycle.dart';

class MenstrualFirstLogic extends GetxController {
  DBMenstrual dbMenstrual = Get.find();

  var list = <MenstrualEntity>[].obs;
  var firstDate = ''.obs;
  var secondDate = ''.obs;
  var thirdDate = ''.obs;
  var fertileStart = ''.obs;
  var fertileEnd = ''.obs;

  Timer? _timer;

  getData() async {
    final result = await dbMenstrual.getMenstrualAllData();
    list.value = result.where((e) => (DateTime.parse(e.content)).isBefore(DateTime.now())).toList();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> select = prefs.getStringList('menstrualSelect') ?? [];
    final menstrualStartTime = DateTime.parse(select.first);
    final menstrualEndTime = DateTime.parse(select.last);

    final menstrualCycle = MenstrualCycle(
      startDate: menstrualStartTime,
      cycleLength: menstrualEndTime.difference(menstrualStartTime).inDays,
      periodDuration: 28,
    );

    final nextMenstrualStartTime =
        menstrualStartTime.add(const Duration(days: 28));
    final nextMenstrualEndTime = menstrualEndTime.add(const Duration(days: 28));

    final nextMenstrualCycle = MenstrualCycle(
      startDate: nextMenstrualStartTime,
      cycleLength:
          nextMenstrualEndTime.difference(nextMenstrualStartTime).inDays,
      periodDuration: 28,
    );

    firstDate.value =
        DateFormat('MM-dd').format(nextMenstrualCycle.fertileWindowStart);
    secondDate.value = DateFormat('MM-dd').format(menstrualCycle.ovulationDate);
    thirdDate.value = DateFormat('MM-dd').format(nextMenstrualCycle.nextPeriodStart);
    if (menstrualCycle.nextPeriodStart.isBefore(DateTime.now())) {
      stopTimer();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('menstrualSelect', [
        menstrualStartTime.add(const Duration(days: 28)).toIso8601String(),
        menstrualEndTime.add(const Duration(days: 28)).toIso8601String()
      ]);
      for (var i = 0; i < nextMenstrualEndTime.difference(nextMenstrualStartTime).inDays; i++) {
        final entity = MenstrualEntity(
            id: 0,
            createdTime: DateTime.now(),
            content:
            nextMenstrualStartTime.add(Duration(days: i)).toIso8601String());
        await dbMenstrual.insertMenstrual(entity);
      }
      startTimer();
    }
    fertileStart.value =
        DateFormat('MM-dd').format(menstrualCycle.fertileWindowStart);
    fertileEnd.value = DateFormat('MM-dd').format(menstrualCycle.fertileWindowEnd);
  }

  void startTimer() {
    stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      getData();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    startTimer();
    super.onInit();
  }
}
