import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/pm_db.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_controller.dart';

class MineController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clear() async {
    await PMDBTool().clean();
    BotToast.showText(text: "Clear Success");
    if (Get.isRegistered<DetailListController>()) {
      Get.find<DetailListController>().loadAllDatas();
    }
  }

  void itemClick(int index) {
    if (index == 0) {
      Get.toNamed('/pet-list', arguments: {"isChoose": false});
    }
  }
}
