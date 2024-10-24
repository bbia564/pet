import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_manager/app/customs/app_util.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/images/assets/assets.dart';

class DetailListCell extends StatelessWidget {
  final PMEventModel eventModel;
  const DetailListCell({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // 阴影颜色，透明度设为0.5
            spreadRadius: 3, // 阴影扩展程度，会使阴影变大
            blurRadius: 6, // 模糊半径，越大越模糊
            offset: const Offset(0, 3), // X和Y轴上的偏移，分别对应阴影的横向和纵向位置
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.w),
            child: (eventModel.photo?.isEmpty ?? true)
                ? Image.asset(
                    Assets.kittty,
                    height: 95.h,
                    width: 85.w,
                    fit: BoxFit.cover,
                  )
                : (eventModel.photo == "Tom"
                    ? Image.asset(
                        Assets.tomHeader,
                        height: 95.h,
                        width: 85.w,
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        base64Decode(eventModel.photo!),
                        height: 95.h,
                        width: 85.w,
                        fit: BoxFit.cover,
                      )),
          ),
          10.horizontalSpace,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(text: eventModel.name ?? ""),
                    TextSpan(
                        text:
                            "(${PMAppUtil.timeCaculate(eventModel.birth!, DateTime.now().millisecondsSinceEpoch, isYear: true)})",
                        style: TextStyle(
                          fontSize: 14.sp,
                        )),
                  ])),
              6.verticalSpace,
              pmGetText("Last-Time: ${eventModel.createTimeStr}",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: PMColorUitl.pmGetColor("#0F0F0F")),
              10.verticalSpace,
              pmDivider(),
              10.verticalSpace,
              Text.rich(TextSpan(
                  style: TextStyle(
                      color: PMColorUitl.pmGetColor("#343434"),
                      fontSize: 14.sp),
                  children: [
                    TextSpan(text: eventModel.event ?? ""),
                    TextSpan(
                        text:
                            "${PMAppUtil.timeCaculate(DateTime.now().millisecondsSinceEpoch, eventModel.eventTime!)}",
                        style: TextStyle(
                            color: PMColorUitl.mainGreen,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w600)),
                    const TextSpan(text: "days"),
                  ]))
            ],
          ))
        ],
      ),
    );
  }
}
