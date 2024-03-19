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
                        "تاريخ الاستلام",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                          _.specimen.receivingDate ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "تاريخ أخذ العينات",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.samplingDate ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "تاريخ التقرير",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.reportDate ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Type",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.specimenType?.name  ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.size?.name  ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Organ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.organ?.name  ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                            ListTile(
                      title: Text(
                        "Biopsy",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.biopsy?.name  ?? 'غير متاح',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Cytology",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _.specimen.cytology?.name  ?? 'غير متاح',
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