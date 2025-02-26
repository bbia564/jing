import 'package:get/get.dart';

import 'menstrual_second_logic.dart';

class MenstrualSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualSecondLogic());
  }
}
