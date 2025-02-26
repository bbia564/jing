import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:menstrual_record/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'menstrual_birthday_logic.dart';

class MenstrualBirthdayPage extends GetView<MenstrualBirthdayLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<MenstrualBirthdayLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text(
                'What is your year of birth?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Knowing your age allows you to make more accurate cycle predictions.',
                textAlign: TextAlign.center,
              ),
              DateTimePickerWidget(
                minDateTime: DateTime(1900),
                maxDateTime: DateTime.now(),
                initDateTime: controller.birthday,
                dateFormat: 'yyyy',
                pickerTheme: const DateTimePickerTheme(
                  showTitle: false,
                  title: null,
                  backgroundColor: Colors.transparent,
                ),
                onChange: (dateTime, selectedIndex) {},
              ).marginSymmetric(vertical: 35),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
                  .decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10))
                  .gestures(onTap: () {
                Get.toNamed('/pregnant');
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
