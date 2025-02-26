import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'menstrual_second_logic.dart';

class MenstrualSecondPage extends GetView<MenstrualSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Period reminder',
      'Recalculate',
      'About US'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 0
            ? Obx(() {
          return Switch(
              activeTrackColor: Colors.green,
              value: controller.remind.value,
              onChanged: (v) async {
                controller.remind.value = v;
                final SharedPreferences prefs = await SharedPreferences
                    .getInstance();
                await prefs.setBool('remind', v);
              });
        })
            : index == 1 ? const Icon(
          Icons.keyboard_arrow_right,
          size: 25,
          color: Colors.grey,
        ) : const Text('1.0.0').paddingOnly(right: 10)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          break;
        case 1:
          controller.cleanMenstrualData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const SizedBox(),
        title: const Text("Setting"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context),
                    _item(2, context)
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
