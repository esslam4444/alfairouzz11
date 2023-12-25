import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/SpecimenSearchController.dart';
import '../routes/app_pages.dart';
import 'LoginView.dart';
import 'log_in_screen.dart';

class SpecimenSearchView extends GetView<SpecimenSearchController> {
  SpecimenSearchView({Key? key}) : super(key: key);

  final List<String> statusOrder = [
    'RECEIVED',
    'GROSSING',
    'PROCESSING',
    'DIAGNOSING',
    'TYPING',
    'REVISION',
    'READY',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مختبر الفيروز"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to( LoginView());
            },
          ),
        ],
      ),
      body: GetBuilder<SpecimenSearchController>(
        init: SpecimenSearchController(),
        initState: (_) {},
        builder: (searchController) {
                    final currentStep = getCurrentStepIndex(searchController.specimen.specimenStatus ?? "");
          print('current stepppp  ${currentStep}');
          return Obx(()=>
             ListView(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'الاستعلام عن العينة',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "ادخل كود العينة",
                      suffixIcon: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.QR_SCANNER);
                        },
                        icon: const Icon(Icons.qr_code_outlined),
                      ),
                    ),
                    controller: searchController.labQr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:ElevatedButton(
                    onPressed: ()  {
                       searchController.findSpecimenByLabQr();
                    },
                    child: const Text('بحث'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                searchController.loading.value
                    ? const CircularProgressIndicator()
                    : const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "النتائج",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                searchController.specimen.id != null
                    ? Card(
                  elevation: 0.5,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(enabled: false,
                    title: Row(
                      children: [
                        Text(
                          searchController.specimen.patient?.nameAr ?? "",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  // Handle PDF icon press here
                                },
                                child: const Icon(Icons.picture_as_pdf_rounded),
                              ),
                      ],
                    ),
                  ),
                )
                    : const SizedBox(child: Text('')),

                SingleChildScrollView(
                  child: Stepper(
                    type: StepperType.vertical,
                    currentStep: currentStep,

                    controlsBuilder: (context, details) {
                      return Container();
                    },
                    steps: statusOrder.map((status) {
                      final index = statusOrder.indexOf(status);
                      print(' this is Index ${index}');
                      return Step(
                        state: isCompleted(status, searchController)  ? StepState.complete :StepState.disabled,
                        isActive:
                         isCompleted(status, searchController) ,
                        title:  Text(
                          status,
                          style: const TextStyle(fontSize: 16),
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       status,
                        //       style: const TextStyle(fontSize: 16),
                        //     ),
                        //     const Spacer(),
                        //     if (status == 'READY' &&
                        //         currentStep <= index &&
                        //         searchController.specimen.specimenStatus == 'READY' &&
                        //         searchController.specimen.notPaid == 0)
                        //       InkWell(
                        //         onTap: () {
                        //           // Handle PDF icon press here
                        //         },
                        //         child: const Icon(Icons.picture_as_pdf_rounded),
                        //       ),
                        //   ],
                        // ),
                        content: const SizedBox(),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  int getCurrentStepIndex(String status) {
    final index = statusOrder.indexOf(status);
   // print('this is the index ${index}');
    return index != -1 ? index : 0;
  }

  bool isCompleted(String status, SpecimenSearchController searchController) {
    return searchController.specimen.specimenStatus == status;
  }
}