import 'package:get/get.dart';

import '../menstrual_birthday/menstrual_birthday_logic.dart';
import '../menstrual_first/menstrual_first_logic.dart';
import '../menstrual_pregnant/menstrual_pregnant_logic.dart';
import '../menstrual_second/menstrual_second_logic.dart';
import '../menstrual_select/menstrual_select_logic.dart';
import 'menstrual_tab_logic.dart';

class MenstrualTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualTabLogic());
    Get.lazyPut(() => MenstrualFirstLogic());
    Get.lazyPut(() => MenstrualSecondLogic());
    Get.lazyPut(() => MenstrualSelectLogic());
    Get.lazyPut(() => MenstrualPregnantLogic());
    Get.lazyPut(() => MenstrualBirthdayLogic());
  }
}
