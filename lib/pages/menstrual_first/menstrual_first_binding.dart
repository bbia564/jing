import 'package:get/get.dart';

import 'menstrual_first_logic.dart';

class MenstrualFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualFirstLogic());
  }
}
