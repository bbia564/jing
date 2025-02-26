import 'package:get/get.dart';

import 'menstrual_birthday_logic.dart';

class MenstrualBirthdayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenstrualBirthdayLogic());
  }
}
