import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SpecimenDetailsController.dart';

class SpecimenDetailsView extends GetView<SpecimenDetailsController> {
  const SpecimenDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("تفاصيل عينة"),
        // centerTitle: true,
      ),
      body: GetBuilder<SpecimenDetailsController>(
        init: SpecimenDetailsController(),
        initState: (_) {},
        builder: (_) {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(" رقم: ${_.specimen.labQr}"),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
