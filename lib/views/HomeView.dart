import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/HomeController.dart';
import '../controllers/HomePdfViewController.dart';
import '../controllers/SpecimenDetailsController.dart';
import '../controllers/SpecimensController.dart';
import '../routes/app_pages.dart';
import 'HomePdfView.dart';
import 'PdfView.dart';
import 'QRScannerView.dart';
import 'SpecimenDetailsView.dart';

class HomeView extends GetView<HomeController> {
  final HomePdfViewController homePdfViewController =
  Get.put(HomePdfViewController());
  final SpecimenDetailsController specimenDetailsController =
  Get.put(SpecimenDetailsController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecimensController>(
      init: SpecimensController(),
      initState: (_) {},
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'العينات',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.logout_rounded),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('هل تريد الخروج '),
                          actions: <Widget>[
                            TextButton(
                              child: Text('الغاء'),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text(
                                'خروج',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                SystemNavigator.pop(); // Exit the application
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            body: Obx(
                  () {
                if (_.loading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _.specimens.length,
                    itemBuilder: (context, index) {
                     //final index= _.specimens.length;
                      final specimen =
                      index < _.specimens.length ? _.specimens[index] : null;
                      return GestureDetector(
                        onTap: () {
                          final controller =
                          Get.find<SpecimenDetailsController>();
                          controller.specimenId.value = specimen?.id ?? 0;
                          controller.findBySpecimenId();

                          // Handle the onTap event and navigate to SpecimenDetailsView
                          Get.to(SpecimenDetailsView());
                        },
                        child: Card(
                          child: ListTile(leading: Text((index + 1).toString()),
                            title: Text(
                              specimen?.patient?.nameAr ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(specimen?.specimenStatus.toString() ?? ''),
                            trailing: specimen?.specimenStatus == 'READY'
                                ? ElevatedButton(
                              onPressed: () {
                                final controller =
                                Get.find<HomePdfViewController>();
                                controller.specimenId.value =
                                    specimen?.id ?? 0;
                                controller.downloadFile();
                                Get.to(HomePdfView());
                              },
                              child: const Text(
                                'التقرير',
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.lightGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(
                                    color: Colors.lightGreen,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            )
                                : const SizedBox(
                              child: Text(''),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}