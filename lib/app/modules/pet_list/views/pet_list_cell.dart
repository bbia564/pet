import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_manager/app/customs/app_util.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/images/assets/assets.dart';

class PetListCell extends StatelessWidget {
  final PetModel petModel;
  final bool isChoose;
  const PetListCell(
      {super.key, required this.petModel, required this.isChoose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: (petModel.photo?.isEmpty ?? true)
                  ? Image.asset(
                      Assets.kittty,
                      height: 95.h,
                      width: 85.w,
                      fit: BoxFit.cover,
                    )
                  : (petModel.photo == "Tom"
                      ? Image.asset(
                          Assets.tomHeader,
                          height: 95.h,
                          width: 85.w,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          base64Decode(petModel.photo!),
                          height: 95.h,
                          width: 85.w,
                          fit: BoxFit.cover,
                        ))

              // Image.memory(
              //   base64Decode(petModel.photo!),
              //   width: 54.w,
              //   height: 50.h,
              //   fit: BoxFit.cover,
              // ),
              ),
          10.horizontalSpace,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  pmGetText(petModel.name ?? ""),
                  const Spacer(),
                  isChoose
                      ? const SizedBox.shrink()
                      : InkWell(
                          child: pmGetText("Edit",
                              textColor: PMColorUitl.mainGreen),
                        )
                ],
              ),
              6.verticalSpace,
              pmGetText(
                  PMAppUtil.formatDate(
                      dateTime: DateTime.fromMillisecondsSinceEpoch(
                          petModel.createTime!)),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: PMColorUitl.pmGetColor("#0F0F0F")),
            ],
          ))
        ],
      ),
    );
  }
}
