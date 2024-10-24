import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/app/customs/pm_db.dart';

class DetailListController extends GetxController {
  final selectedPet = Rx<PetModel?>(null);
  final eventDate = Rx<DateTime?>(null);
  String eventStr = "";

  final allEvents = <PMEventModel>[].obs;
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

  void loadAllDatas() async {
    allEvents.value = await PMDBTool().getEvents();
  }

  void toDetail(PMEventModel model) {
    Get.toNamed('/detail-page', arguments: {"model": model});
  }

  void chooseDate() async {
    final today = DateTime.now();
    pmShowDatePicker("Date",
        initialDateTime: today,
        minDatetime: DateTime(today.year, today.month, today.day),
        maxDatetime: DateTime(2030, 12, 31),
        type: CupertinoDatePickerMode.dateAndTime, (date) {
      eventDate.value = date;
    });
  }

  void toChooosePet() async {
    final result =
        await Get.toNamed('/pet-list', arguments: {"isChoose": true});

    if (result == null) {
      return;
    }

    selectedPet.value = result as PetModel;
  }

  void add() async {
    if (selectedPet.value == null) {
      BotToast.showText(text: "Please select a pet");

      return;
    }
    if (eventDate.value == null) {
      BotToast.showText(text: "Please select time");

      return;
    }
    if (eventStr.isEmpty) {
      BotToast.showText(text: "Please fill in the event");

      return;
    }
    Get.back();
    final eventModel = PMEventModel();
    eventModel.event = eventStr;
    eventModel.petId = selectedPet.value!.id;
    eventModel.name = selectedPet.value!.name;
    eventModel.birth = selectedPet.value!.birth;
    eventModel.photo = selectedPet.value!.photo;
    eventModel.eventTime = eventDate.value!.millisecondsSinceEpoch;
    eventModel.createTime = DateTime.now().millisecondsSinceEpoch;
    await PMDBTool().insertEventModel(eventModel);
    loadAllDatas();

    eventStr = "";
    eventDate.value = null;
    selectedPet.value = null;
  }
}
