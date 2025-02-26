import 'package:get/get.dart';

import 'menstrual_pregnant_logic.dart';

class MenstrualPregnantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualPregnantLogic());
  }
}
