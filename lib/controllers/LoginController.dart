
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/login.dart';
import '../models/specimen_model.dart';
import '../repositories/auth_repository.dart';
import '../routes/app_pages.dart';
import '../utils/consts.dart';
import 'SpecimenDetailsController.dart';
import 'SpecimensController.dart';

 class LoginController extends GetxController {

   // SpecimensController? compositionSpecimen;
 //  var specimenList;
   //----
  final _authRepo = Get.find<AuthRepository>();

  late GlobalKey<FormState> _loginFormKey;

  get loginFormKey => _loginFormKey;

  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();
//---------------------\


  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Const.primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
   //LoginController({ compositionSpecimen, });
  @override
  Future<void> onInit() async {
    _loginFormKey = GlobalKey<FormState>();

    loginEmail.text = Get.find<GetStorage>().read("username");
    loginPassword.text = Get.find<GetStorage>().read("password");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  login() async {

    if (loginFormKey.currentState.validate()) {
      // final findAllSpecimen = Get.find<SpecimensController>();
      // findAllSpecimen.specimenRepository.findAllSpecimen();
      Get.dialog(
        WillPopScope(onWillPop: () async => false, child: const Center(child: CircularProgressIndicator())),
        barrierDismissible: false,
      );
      LoginVM user = LoginVM(username: loginEmail.text, password: loginPassword.text, rememberMe: true);

      await _authRepo.authorize(user).then((value) {
        if (value == true) {
          Get.offAllNamed(Routes.HOME);
          Get.find<GetStorage>().write("username", user.username);
          Get.find<GetStorage>().write("password", user.password);
        }
      });
    }
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
