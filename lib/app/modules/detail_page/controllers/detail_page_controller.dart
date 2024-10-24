import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/app/customs/pm_db.dart';

class DetailPageController extends GetxController {
  final PMEventModel model = Get.arguments["model"];
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

  void refresh() async {
    final cenal = BotToast.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    cenal();
  }

  void getDetailList() async {
    await PMDBTool().getEvents(id: model.petId);
  }
}
