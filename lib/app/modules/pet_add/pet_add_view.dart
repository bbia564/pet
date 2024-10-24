import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_manager/app/customs/app_util.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/detailList/add_new_schedule.dart';
import 'package:pet_manager/images/assets/assets.dart';

import 'pet_add_controller.dart';

class PetAddView extends GetView<PetAddController> {
  const PetAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: pmGetContainer(
            radius: 10.w,
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pmGetText("  Pet name", fontSize: 14, fontWeight: FontWeight.w500),
                10.verticalSpace,
                mainBgView(_inputView()),
                15.verticalSpace,
                pmGetText("  Pet Birth", fontSize: 14, fontWeight: FontWeight.w500),
                10.verticalSpace,
                InkWell(
                  onTap: controller.chooseBirth,
                  child: mainBgView(Row(
                    children: [
                      Obx(() {
                        final hasDate = controller.birthDate.value != null;
                        return pmGetText(
                            hasDate
                                ? "  ${PMAppUtil.formatDateWithoutHour(dateTime: controller.birthDate.value!)}"
                                : "  Select birth",
                            textColor: hasDate
                                ? Colors.black
                                : PMColorUitl.pmGetColor("#BABABA"),
                            fontWeight: FontWeight.w400);
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
                19.verticalSpace,
                pmGetText("  Photos", fontSize: 14, fontWeight: FontWeight.w500),
                16.verticalSpace,
                Obx(() => controller.imageData.isEmpty
                    ? InkWell(
                        onTap: controller.selectPic,
                        child: pmGetContainer(
                            radius: 8.w,
                            width: 90.w,
                            height: 90.w,
                            alignment: Alignment.center,
                            color: PMColorUitl.pmGetColor("#F7F7F7"),
                            child: Image.asset(
                              Assets.addPet,
                              height: 20.h,
                              width: 20.w,
                            )),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.w),
                        child: Image.memory(
                          base64Decode(controller.imageData.value),
                          width: 90.w,
                          height: 90.h,
                          fit: BoxFit.cover,
                        ),
                      )),
                23.verticalSpace,
                InkWell(
                  onTap: controller.addNew,
                  child: pmGetContainer(
                      height: 50.h,
                      radius: 8.w,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: PMColorUitl.mainGreen,
                      child: pmGetText("Submit", textColor: Colors.white)),
                ),
                Obx(() => controller.isEidt.isTrue
                    ? 10.verticalSpace
                    : const SizedBox.shrink()),
                Obx(() => controller.isEidt.isTrue
                    ? InkWell(
                        onTap: controller.deletePet,
                        child: pmGetContainer(
                            height: 50.h,
                            radius: 8.w,
                            width: double.infinity,
                            alignment: Alignment.center,
                            color: PMColorUitl.pmGetColor("#EAEAEA"),
                            child: pmGetText("Delet",
                                textColor: PMColorUitl.pmGetColor("#555555"))),
                      )
                    : const SizedBox.shrink()),
              ],
            )),
      ),
    );
  }

  Widget _inputView() {
    return TextField(
        controller: controller.inputController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.left,
        maxLength: 10,
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
        decoration: InputDecoration(
            counterText: "",
            border: InputBorder.none,
            hintText: 'input nickname',
            hintStyle: TextStyle(
                color: PMColorUitl.pmGetColor('#8C8C8C'),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal)),
        onChanged: (value) {});
  }
}
