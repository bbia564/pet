import 'package:get/get.dart';

import 'list_mo_logic.dart';

class ListMoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
