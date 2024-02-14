

import 'package:get/get.dart';

import '../models/specimen_model.dart';
import '../repositories/specimen_repository.dart';
import 'PdfViewController.dart';

class SpecimensController extends GetxController {
 //  final Rx<Specimen> _specimen = Get.put(Specimen()).obs;

  final specimenRepository = Get.find<SpecimenRepository>();
  final loading = false.obs;
  final specimens = <Specimen>[].obs;

  final patient = <Patient>[].obs;
   PdfViewController? pdfViewController;
 // final bool isMine = Get.arguments;

  @override
  void onInit() {
    findAllSpecimens();

    super.onInit();
  }

  Future<void> findAllSpecimens() async {
    try {
      loading.value = true;
      final response = await specimenRepository.findAllSpecimen();
      specimens.assignAll(response);
      update();
    } finally {
      loading.value = false;
    }
  }

}

class SpecimensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecimensController>(
      () => SpecimensController(),
    );
  }
}
