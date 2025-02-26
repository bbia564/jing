import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menstrual_record/db_menstrual/db_menstrual.dart';
import 'package:menstrual_record/pages/menstrual_first/menstrual_first_logic.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenstrualSecondLogic extends GetxController {
  var remind = true.obs;

  MenstrualFirstLogic firstLogic = Get.put(MenstrualFirstLogic());

  DBMenstrual dbMenstrual = Get.find();

  cleanMenstrualData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            await dbMenstrual.cleanMenstrualData();
            firstLogic.stopTimer();
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('menstrualSelect');
            Get.back();
            Get.offAllNamed('/birthday');
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutMenstrualUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text("""We can record your period"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    remind.value = prefs.getBool('remind') ?? true;
    super.onInit();
  }
}
