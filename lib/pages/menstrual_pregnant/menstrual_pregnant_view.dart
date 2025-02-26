import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'menstrual_pregnant_logic.dart';

class MenstrualPregnantPage extends GetView<MenstrualPregnantLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<MenstrualPregnantLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text(
                'How many weeks pregnant are you?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 300,
                child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: controller.selectedIndex),
                    itemExtent: 40,
                    useMagnifier: true,
                    magnification: 1.2,
                    onSelectedItemChanged: (v) {
                      controller.selectedIndex = v;
                      controller.update();
                    },
                    children: List.generate(41, (index) {
                      return Center(
                        child: Text(
                          '${index+1}',
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.selectedIndex == index ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    })).marginSymmetric(vertical: 35),
              ),
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
                Get.toNamed('/select');
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
