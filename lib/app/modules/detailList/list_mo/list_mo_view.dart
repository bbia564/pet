import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_mo_logic.dart';

class ListMoView extends GetView<PageLogic> {
  const ListMoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.kunde.value
              ? const CircularProgressIndicator(color: Colors.green)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.axki();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
