import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'dart:convert';

import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/app/customs/pm_db.dart';

class PetAddController extends GetxController {
  final inputController = TextEditingController();
  final birthDate = Rx<DateTime?>(null);
  final imageData = "".obs;
  PetModel? petModel;

  final isEidt = false.obs;

  @override
  void onInit() {
    super.onInit();

    petModel = Get.arguments["petmodel"];
    if (petModel != null) {
      inputController.text = petModel!.name ?? "";
      birthDate.value = DateTime.fromMillisecondsSinceEpoch(petModel!.birth!);
      imageData.value = petModel!.photo ?? "";
      isEidt.value = true;
    } else {
      isEidt.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }

  void chooseBirth() {
    pmShowDatePicker("Pet birth", (date) {
      birthDate.value = date;
    });
  }

  void selectPic() async {
    final file = await pickMultiImageXFile();
    if (file.isEmpty) {
      return;
    }

    final image = file.first;

    final bytes = await image.readAsBytes();
    imageData.value = base64Encode(bytes);
  }

  void deletePet() async {
    if (petModel == null) {
      return;
    }

    await PMDBTool().deletePet(petModel!.id!);
    Get.back(result: true);
    BotToast.showText(text: "Delet Success");
  }

  void addNew() async {
    if (inputController.text.isEmpty) {
      BotToast.showText(text: "Please enter pet nickname");
      return;
    }

    if (birthDate.value == null) {
      BotToast.showText(text: "Please select your pet's birthday");
      return;
    }
    if (imageData.value.isEmpty) {
      BotToast.showText(text: "Please select a photo of your pet");
      return;
    }

    final newModel = PetModel();
    newModel.name = inputController.text;
    newModel.photo = imageData.value;
    newModel.birth = birthDate.value!.millisecondsSinceEpoch;
    newModel.createTime = DateTime.now().millisecondsSinceEpoch;

    if (petModel != null) {
      newModel.id = petModel?.id;
      await PMDBTool().updatePetModel(newModel);
      newModel.setStr();
      Get.back(result: newModel);
    } else {
      await PMDBTool().insertPetDate(newModel);
      newModel.setStr();
      Get.back(result: newModel);
    }
  }
}
