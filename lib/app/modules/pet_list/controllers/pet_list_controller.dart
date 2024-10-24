import 'package:get/get.dart';
import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/app/customs/pm_db.dart';

class PetListController extends GetxController {
  final pets = <PetModel>[].obs;
  final bool isChoose = Get.arguments["isChoose"] ?? false;
  @override
  void onInit() {
    super.onInit();
    loadDatas();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void petItemClick(int index, PetModel model) async {
    if (isChoose) {
      Get.back(result: model);
    } else {
      final result =
          await Get.toNamed('/pet-list', arguments: {"petmodel": model});
      loadDatas();
    }
  }

  void loadDatas() async {
    pets.value = await PMDBTool().getPetDatas();
    
  }
}
