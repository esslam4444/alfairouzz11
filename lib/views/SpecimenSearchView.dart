import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/PdfViewController.dart';
import '../controllers/SpecimenDetailsController.dart';
import '../controllers/SpecimenSearchController.dart';
import '../controllers/SpecimensController.dart';
import '../routes/app_pages.dart';
import 'LoginView.dart';
import 'PdfView.dart';
import 'log_in_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';


class SpecimenSearchView extends GetView<SpecimenSearchController> {

 // final SpecimensController specimensController = Get.put(SpecimensController());
 // final PdfViewController pdfViewController = Get.put(PdfViewController());

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
        //  final specimenIdView =searchController.specimen.id;
                    final currentStep = getCurrentStepIndex(searchController.specimen.specimenStatus ?? "");
          print('current stepppp  ${currentStep}');
          return Obx(()=>
              GestureDetector(
                onTap: () {
                  // Unfocus the text field when tapped outside
                  FocusScope.of(context).unfocus();
                },
               child: ListView(
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
                      onPressed: () {
                        searchController.findSpecimenByLabQr();

                        // Hide the keyboard
                        FocusScope.of(context).unfocus();
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
                    elevation: 2,
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
                          searchController.specimen.specimenStatus == 'READY'?
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // downloadPdf();

                                      // PdfViewController pdfViewController = Get.find<PdfViewController>();
                                      //
                                      // //specimenDetailsController.findBySpecimenId();
                                      searchController.specimen.specimenStatus == 'READY'?
                                          Get.to(PdfView())
                                          :Null;
                                      // specimenDetailsController.specimenSearchController?.specimen.id;
                                      // print('ididididididididid${specimenDetailsController.specimenSearchController?.specimen.id}');

                                    },
                                    child: Text('حمل العينة Pdf'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepOrange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                )
                            : const SizedBox(child: Text('')),
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


