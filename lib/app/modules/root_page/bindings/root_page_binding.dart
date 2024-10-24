import 'package:get/get.dart';
import 'package:pet_manager/app/customs/pm_share_per.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_controller.dart';
import 'package:pet_manager/app/modules/mine/mine_controller.dart';

import '../controllers/root_page_controller.dart';

class RootPageBinding extends Bindings {
  @override
  void dependencies() {
    PMSharedPreferences.initialize();
    Get.lazyPut<RootPageController>(
      () => RootPageController(),
    );
    Get.lazyPut<DetailListController>(
      () => DetailListController(),
    );
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
}
