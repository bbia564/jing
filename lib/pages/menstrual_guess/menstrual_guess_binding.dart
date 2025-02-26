import 'package:get/get.dart';

import 'menstrual_guess_logic.dart';

class MenstrualGuessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
