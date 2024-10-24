import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_manager/app/customs/color_tool.dart';
import 'package:pet_manager/app/customs/componets.dart';
import 'package:pet_manager/app/modules/pet_list/views/pet_list_cell.dart';
import '../controllers/pet_list_controller.dart';

class PetListView extends GetView<PetListController> {
  const PetListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pmGetText("Pet List"),
        centerTitle: true,
      ),
      body: Obx(() => controller.pets.isEmpty
          ? Center(
              child: pmGetText("no data yet",
                  textColor: PMColorUitl.pmGetColor("#999999"),
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            )
          : ListView.builder(
              itemCount: controller.pets.length,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemBuilder: (context, index) {
                final model = controller.pets[index];
                return InkWell(
                  onTap: () {
                    controller.petItemClick(index, model);
                  },
                  child: PetListCell(
                      petModel: model, isChoose: controller.isChoose),
                );
              },
            )),
    );
  }
}
