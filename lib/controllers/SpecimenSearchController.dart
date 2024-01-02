import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/specimen_model.dart';
import '../repositories/specimen_repository.dart';
import 'PdfViewController.dart';

class SpecimenSearchController extends GetxController {
  final specimenRepository = Get.find<SpecimenRepository>();


  final loading = false.obs;
  var labQr = TextEditingController();

  final Rx<Specimen> _specimen = Specimen().obs;

  Specimen get specimen => _specimen.value;

  final Rx<Patient> _patient = Patient().obs;

  Patient get patient => _patient.value;

  PdfViewController? pdfViewController;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    labQr.dispose();
    super.onClose();
  }

  Future<void> findSpecimenByLabQr() async {
    try {
      loading.value = true;
      _specimen.value = await specimenRepository.findBySpecimenLabQr(labQr.text);
    } catch (e) {
      // Handle the error
    } finally {
      loading.value = false;
    }
  }


}

class SpecimenSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecimenSearchController>(() => SpecimenSearchController());
  }
}