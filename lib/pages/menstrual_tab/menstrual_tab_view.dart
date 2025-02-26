import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menstrual_record/db_menstrual/db_menstrual.dart';
import 'package:menstrual_record/pages/menstrual_first/menstrual_first_view.dart';
import 'package:menstrual_record/pages/menstrual_second/menstrual_second_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menstrual_first/menstrual_first_logic.dart';
import 'menstrual_tab_logic.dart';

class MenstrualTabPage extends GetView<MenstrualTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          MenstrualFirstPage(),
          MenstrualSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navMenBars()),
    );
  }

  Widget _navMenBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Recalculate',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        if (index == 1) {
          DBMenstrual dbMenstrual = Get.find();
          await dbMenstrual.cleanMenstrualData();
          MenstrualFirstLogic firstLogic = Get.put(MenstrualFirstLogic());
          firstLogic.stopTimer();
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('menstrualSelect');
          Get.back();
          Get.offAllNamed('/birthday');
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
