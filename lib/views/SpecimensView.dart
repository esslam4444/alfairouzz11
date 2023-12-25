import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SpecimensController.dart';
import '../routes/app_pages.dart';

class SpecimensView extends GetView<SpecimensController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("جميع المخالفات"),
        // centerTitle: true,
      ),
      body: GetBuilder<SpecimensController>(
        init: SpecimensController(),
        initState: (_) {},
        builder: (controller) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 20),
            separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 10,
            ),
            itemCount: controller.specimens.length,
            itemBuilder: (BuildContext context, int index) => Card(
              elevation: 0.5,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                trailing: Text('${controller.specimens[index].total} د.ل ', style: TextStyle(fontWeight: FontWeight.bold)),
                title: Text(
                  "${controller.specimens[index].labQr}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Get.toNamed(Routes.SPECIMEN_DETAILS, arguments: controller.specimens[index].id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
