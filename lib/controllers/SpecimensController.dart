

import 'package:get/get.dart';

import '../models/specimen_model.dart';
import '../repositories/specimen_repository.dart';
import 'PdfViewController.dart';

class SpecimensController extends GetxController {
 //  final Rx<Specimen> _specimen = Get.put(Specimen()).obs;

  final specimenRepository = Get.find<SpecimenRepository>();
  final loading = false.obs;
  final specimens = <Specimen>[].obs;
  var page = 0.obs;
  var hasReachedEnd = false.obs;

  final patient = <Patient>[].obs;
   PdfViewController? pdfViewController;
 // final bool isMine = Get.arguments;

  @override
  void onInit() {

    findAllSpecimens();
    super.onInit();
  }

  // Future<void> findAllSpecimens() async {
  //   try {
  //     //loading.value = true;
  //     if(specimens.isEmpty){
  //       loading.value = true;
  //     }
  //     final response = await specimenRepository.findAllSpecimen(page);
  //
  //     if (response.isNotEmpty) {
  //       // Append the new specimens to the existing list
  //       specimens.addAll(response);
  //       page.value++;
  //     } else {
  //       // Indicates that there are no more pages to load
  //       hasReachedEnd.value = true;
  //     }
  //
  //     update();
  //   } finally {
  //     loading.value = false;
  //   }
  // }

  Future<void> findAllSpecimens() async {
    if (loading.value || hasReachedEnd.value) {
      // Return early if loading is already in progress or reached the end
      return;
    }

    try {
     // loading.value = true;
          if(specimens.isEmpty){
            loading.value = true;
          }
      final response = await specimenRepository.findAllSpecimen(page);

      if (response.isNotEmpty) {
        specimens.addAll(response);
        page.value++;
      } else {
        hasReachedEnd.value = true;
      }

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
