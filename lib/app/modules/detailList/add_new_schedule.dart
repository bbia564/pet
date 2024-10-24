import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_manager/app/customs/app_util.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_controller.dart';
import 'package:pet_manager/images/assets/assets.dart';

class AddNewSchedule extends StatelessWidget {
  const AddNewSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailListController());
    return Container(
      width: 1.sw,
      constraints:
          BoxConstraints(minHeight: 450.h, maxHeight: max(450, 1.sh * 0.8)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w), topRight: Radius.circular(20.w)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(controller),
            16.verticalSpace,
            pmDivider(),
            24.verticalSpace,
            Row(
              children: [
                pmGetText("Select Pet", fontSize: 14, fontWeight: FontWeight.w500),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed('/pet-add', arguments: {"isEidt": false});
                  },
                  child: Text(
                    "Create pet profile",
                    style: TextStyle(
                        color: PMColorUitl.mainGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: PMColorUitl.mainGreen),
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            InkWell(
              onTap: controller.toChooosePet,
              child: mainBgView(Row(
                children: [
                  Obx(() {
                    final hsamodel = controller.selectedPet.value != null;
                    return pmGetText(
                        hsamodel ? controller.selectedPet.value!.name! : "Choose a pet",
                        textColor: hsamodel
                            ? Colors.black
                            : PMColorUitl.pmGetColor("#BABABA"));
                  }),
                  const Spacer(),
                  Image.asset(
                    Assets.jaintou,
                    height: 20.w,
                    width: 20.w,
                  )
                ],
              )),
            ),
            15.verticalSpace,
            pmGetText("Plan name", fontSize: 14, fontWeight: FontWeight.w500),
            10.verticalSpace,
            mainBgView(_inputView(controller)),
            15.verticalSpace,
            pmGetText("Planned cycle time", fontSize: 14, fontWeight: FontWeight.w500),
            10.verticalSpace,
            InkWell(
              onTap: controller.chooseDate,
              child: mainBgView(Row(
                children: [
                  Obx(() {
                    final hasDate = controller.eventDate.value != null;
                    return pmGetText(
                        hasDate
                            ? PMAppUtil.formatDate(
                                dateTime: controller.eventDate.value!)
                            : "Please select time",
                        textColor: hasDate
                            ? Colors.black
                            : PMColorUitl.pmGetColor("#BABABA"));
                  }),
                  const Spacer(),
                  Image.asset(
                    Assets.jaintou,
                    height: 20.w,
                    width: 20.w,
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(DetailListController control) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        8.horizontalSpace,
        InkWell(
          onTap: Get.back,
          child: pmGetText("Cancel",
              textColor: PMColorUitl.pmGetColor("#ACACAC"),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        pmGetText("Add Plan"),
        const Spacer(),
        InkWell(
          onTap: control.add,
          child: pmGetText("Commit", textColor: PMColorUitl.mainGreen),
        ),
        8.horizontalSpace
      ],
    );
  }

  Widget _inputView(DetailListController controller) {
    return TextField(

        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.left,
        maxLength: 10,
        style: TextStyle(
            color: PMColorUitl.pmGetColor("#3C3C3C"), fontSize: 16.sp),
        decoration: InputDecoration(
          
            counterText: "",
            border: InputBorder.none,
            hintText: 'input plan',
            hintStyle: TextStyle(
                color: PMColorUitl.pmGetColor('#8C8C8C'),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal)),
        onChanged: (value) {
          controller.eventStr = value;
        });
  }
}

Widget mainBgView(Widget child, {double radius = 4}) {
  return pmGetContainer(
      radius: radius.w,
      height: 50.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: PMColorUitl.pmGetColor("#FDFDFD"),
      borderColor: PMColorUitl.pmGetColor("#EDEDED"),
      child: child);
}
