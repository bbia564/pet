import 'package:get/get.dart';

import 'detail_list_controller.dart';

class DetailListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailListController>(
      () => DetailListController(),
    );
  }
}
