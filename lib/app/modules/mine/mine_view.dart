import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pet_manager/app/customs/base_view.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/detailList/add_new_schedule.dart';
import 'package:pet_manager/images/assets/assets.dart';

import 'mine_controller.dart';

class MineView extends PMBaseView<MineController> {
  const MineView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    final List<String> titles = ["Pet List", "About"];
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),child: InkWell(
            onTap: controller.clear,

            child: settingCell("Clear",showIcon: true),
          ),),
        
          pmGetContainer(
              radius: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    final ti = titles[index];
                    return InkWell(
                      onTap: () {
                        controller.itemClick(index);
                      },
                      child: settingCell(ti,showIcon: index == 0),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: PMColorUitl.pmGetColor("#f4f4f4"),
                        height: 1,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                  itemCount: titles.length))
        ],
      );
  }

  @override
  String viewTitle() {
    return "Settings";
  }

  Widget settingCell(String title, {bool showIcon = false}){
    return mainBgView(Row(
              children: [
                pmGetText(title),
                const Spacer(),
                showIcon ? Image.asset(
                  Assets.jaintou,
                  height: 20.w,
                  width: 20.w,
                ) : const Text('1.0.0').paddingOnly(right: 10)
              ],
            ),radius: 10.w);
  }
}
