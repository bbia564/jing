import 'package:get/get.dart';

import 'menstrual_select_logic.dart';

class MenstrualSelectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualSelectLogic());
  }
}
