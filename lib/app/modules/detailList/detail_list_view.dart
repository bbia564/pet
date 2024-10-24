import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pet_manager/app/customs/base_view.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_cell.dart';

import 'detail_list_controller.dart';

class DetailListView extends PMBaseView<DetailListController> {
  const DetailListView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    return Obx(() => controller.allEvents.isEmpty
        ? Center(
            child: pmGetText("not data yet",
                textColor: PMColorUitl.pmGetColor("#999999"),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          )
        : ListView.builder(
            itemCount: controller.allEvents.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            itemBuilder: (context, index) {
              final model = controller.allEvents[index];
              return InkWell(
                onTap: (){
                  controller.toDetail(model);
                },
                child: DetailListCell(eventModel: model),
              );
            },
          ));
  }

  @override
  String viewTitle() {
    return "Pet-Plan";
  }
}
