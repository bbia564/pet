import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_cell.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Detail"),
        centerTitle: true,
        actions: [
          Padding(padding: EdgeInsets.only(right: 20.w),child: InkWell(
            child: InkWell(
              onTap: controller.refresh,
              child: pmGetText("Refresh",textColor: PMColorUitl.mainGreen),),
          ),)
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16.w),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
          DetailListCell(eventModel: controller.model),
          6.verticalSpace,
          Expanded(child: pmGetContainer(
            radius: 10.w,
            child: Center(
            child: pmGetText("no finished plan",
                textColor: PMColorUitl.pmGetColor("#999999"),
                fontWeight: FontWeight.w400,
                fontSize: 12),
          )
          ))
        ],
      ),),
    );
  }
}
