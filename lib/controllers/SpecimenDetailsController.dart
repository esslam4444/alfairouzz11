import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/specimen_model.dart';
import '../repositories/specimen_repository.dart';
import 'SpecimenSearchController.dart';

class SpecimenDetailsController extends GetxController {

  final specimenRepository = Get.find<SpecimenRepository>();

  final loading = false.obs;

  final Rx<Specimen> _specimen = Specimen().obs;

  Specimen get specimen => _specimen.value;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  findBySpecimenId() async {
    try {
      loading.value = true;
      _specimen.value = await specimenRepository.findBySpecimenId();


      update();
    } finally {
      loading.value = false;
    }
  }

}



class SpecimenDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecimenDetailsController>(
      () => SpecimenDetailsController(),
    );
  }
}
