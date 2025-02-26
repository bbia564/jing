import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:menstrual_record/pages/menstrual_select/menstrual_text_field.dart';
import 'package:menstrual_record/pages/menstrual_select/rate_item.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'menstrual_select_logic.dart';

class MenstrualSelectPage extends GetView<MenstrualSelectLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const SizedBox(), title: const Text('Menstrual Select')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: GetBuilder<MenstrualSelectLogic>(builder: (_) {
            return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      value: controller.selectedDates,
                      onValueChanged: (dates) {
                        if (dates.length == 2 &&
                            (dates.last.difference(dates.first)).inDays > 12) {
                          controller.selectedDates = [];
                          controller.update();
                          Fluttertoast.showToast(
                              msg:
                                  'Please select a period of less than 12 days');
                          return;
                        }
                        controller.selectedDates = dates;
                      },
                    ),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const Text(
                        'Flow rate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RateItem(
                          value: controller.rate,
                          onChange: (v) {
                            controller.rate = v;
                            controller.update();
                          })
                    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const Text(
                        'Mark',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MenstrualTextField(
                          maxLength: 200,
                          maxLines: 6,
                          value: controller.content,
                          onChange: (v) {
                            controller.content = v;
                          })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Commit',
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
                    controller.commit();
                  })
                ].toColumn());
          }),
        ).marginAll(15),
      ),
    );
  }
}
