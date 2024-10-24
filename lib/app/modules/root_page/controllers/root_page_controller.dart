import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/pm_db.dart';
import 'package:pet_manager/app/modules/detailList/add_new_schedule.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_view.dart';
import 'package:pet_manager/app/modules/mine/mine_view.dart';

class RootPageController extends GetxController {
  RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    const DetailListView(),
    Container(),
    const MineView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    PMDBTool().init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCurrentPageIndex(int index) {
    currentIndex.value = index;
  }

  void showAddView() {
    Get.bottomSheet(const AddNewSchedule());
  }
}
