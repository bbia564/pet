import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/images/assets/assets.dart';

import '../controllers/root_page_controller.dart';

class RootPageView extends GetView<RootPageController> {
  const RootPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              controller.currentIndex.value = value;
            },
            children: controller.pageList,
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: PMColorUitl.pmGetColor("#2EB738"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.h)),
              onPressed: controller.showAddView,
              child: Image.asset(
                Assets.add,
                height: 14.w,
                width: 14.w,
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            fixedColor: PMColorUitl.pmGetColor("#2EB738"),
            onTap: (value) {
              if (value == 1) {
                controller.showAddView();
                return;
              }
              controller.currentIndex.value = value;
              controller.pageController.jumpToPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.firtstTabNor),
                  activeIcon: _tbTbarItem(Assets.firtstTabSel),
                  label: "All Plan"),
              BottomNavigationBarItem(
                  icon: _tbTbarItem(Assets.add),
                  activeIcon: _tbTbarItem(Assets.add),
                  label: "New Plan"),
              BottomNavigationBarItem(
                label: "Setttings",
                icon: _tbTbarItem(Assets.lastTabNor),
                activeIcon: _tbTbarItem(Assets.lastTabSel),
              )
            ],
          ),
        ));
  }

  Widget _tbTbarItem(String name) {
    return Image.asset(
      name,
      height: 22.h,
      width: 22.h,
      fit: BoxFit.cover,
    );
  }
}
