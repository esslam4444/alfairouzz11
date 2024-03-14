import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SpecimenDetailsController.dart';

class SpecimenDetailsView extends GetView<SpecimenDetailsController> {
  final SpecimenDetailsController specimenDetailsController =
  Get.put(SpecimenDetailsController());

  SpecimenDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل العينة"),
      ),
      body: GetBuilder<SpecimenDetailsController>(
        init: SpecimenDetailsController(),
        initState: (_) {},
        builder: (_) {
          if (_.loading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "اسم المريض",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.patient?.nameAr ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "الجهة المرسلة",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.referringCenter?.name ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "اسم الدكتور",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.referringDoctor?.name ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "حالة العينة",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.specimenStatus ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "النتيجة",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.results ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "السعر",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '   ${_.specimen.price.toString() ?? 'غير متاح'}  دينار ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    // Add more details as needed
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}