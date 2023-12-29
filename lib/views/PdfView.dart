import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../controllers/PdfViewController.dart';
import '../controllers/SpecimenDetailsController.dart';
import '../controllers/SpecimenSearchController.dart';
import '../controllers/SpecimensController.dart';
import '../repositories/specimen_repository.dart';
import '../routes/app_pages.dart';

class PdfView extends GetView<PdfViewController> {
  final PdfViewController pdfViewController = Get.put(PdfViewController());

   PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: Obx(() {
          final state = pdfViewController.downloadState.value;
          print('this is the state state ${state}');
          if (state is DownloadingState) {
            return Container(
              height: 120.0,
              width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Downloading File: ${state.progressString}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is CompletedState) {
            return PDFView(
              filePath: state.localFilePath,
            );
          } else {
            return Text("No Data");
          }
        }),
      ),
    );
  }
}

