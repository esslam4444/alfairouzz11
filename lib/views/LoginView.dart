
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/LoginController.dart';
// import '../controllers/SpecimensController.dart';
// import '../repositories/specimen_repository.dart';
// import '../utils/consts.dart';
//
// class LoginView extends GetView<SpecimensController> {
//   // final SpecimensController specimensController = Get.put(SpecimensController()); // Instantiate the SpecimenRepository object
//
//   // SpecimensController({
//   //   Key? key,
//   // }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white, // Set the AppBar color to white
//           leading: IconButton(
//             color: Colors.black,
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Get.back();
//               // Handle the back button tap here
//             },
//           ),
//         ),
//         body: GetBuilder<SpecimensController>(
//           init: SpecimensController( ),
//           initState: (SpecimensController) {},
//           builder: (SpecimensController) {
//             return Form(
//             //  key: _.loginFormKey,
//               child: Column(
//                 children: [
//                   // Image.asset(
//                   //   "assets/images/logo.png",
//                   //   width: 150,
//                   // ),
//                   const Text(
//                     'تسجيل الدخول',
//                     style: TextStyle(
//                       fontSize: 32.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: SizedBox(
//                       height: Get.height * .065,
//                       child: TextFormField(
//                         style: const TextStyle(
//                           color: Const.primaryColor,
//                         ),
//                         cursorColor: Const.primaryColor,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'اسم المستخدم',
//                           prefixIcon: Icon(
//                             Icons.phone_android_sharp,
//                             color: Colors.black,
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'يجب عليك إدخال رقم الهاتف'.tr;
//                           }
//                           return null;
//                         },
//                        // controller: _.loginEmail,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: SizedBox(
//                       height: Get.height * .065,
//                       child: TextFormField(
//                         obscureText: true,
//                         style: const TextStyle(color: Const.primaryColor),
//                         cursorColor: Const.primaryColor,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'كلمة المرور',
//                           prefixIcon: Icon(
//                             Icons.lock,
//                             color: Colors.black,
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'يجب عليك إدخال كلمة المرور'.tr;
//                           } else {
//                             return null;
//                           }
//                         },
//                       //  controller: _.loginPassword,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
//                     child: InkWell(
//                       child: Text(
//                         'هل نسيت كلمة المرور؟',
//                         style: TextStyle(
//                           fontSize: Get.width * 0.04,
//                           color: Const.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             SpecimensController.findAllSpecimens(); // Use the SpecimenRepository object
//                           //  _.login();
//                           },
//                           child: const Text("دخول"),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/LoginController.dart';
import '../controllers/SpecimensController.dart';
import '../repositories/specimen_repository.dart';
import '../utils/consts.dart';

class LoginView extends GetView<LoginController> {
  final SpecimensController specimensController = Get.put(SpecimensController()); // Instantiate the SpecimenRepository object
  //
  //   LoginView({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Set the AppBar color to white
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              // Handle the back button tap here
            },
          ),
        ),
        body: GetBuilder<LoginController>(
          init: LoginController( ),
          initState: (_) {},
          builder: (_) {
            return Form(
              key: _.loginFormKey,
              child: Column(
                children: [
                  // Image.asset(
                  //   "assets/images/logo.png",
                  //   width: 150,
                  // ),
                  const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: Get.height * .065,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Const.primaryColor,
                        ),
                        cursorColor: Const.primaryColor,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'اسم المستخدم',
                          prefixIcon: Icon(
                            Icons.phone_android_sharp,
                            color: Colors.black,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يجب عليك إدخال رقم الهاتف'.tr;
                          }
                          return null;
                        },
                        controller: _.loginEmail,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: Get.height * .065,
                      child: TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Const.primaryColor),
                        cursorColor: Const.primaryColor,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'كلمة المرور',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يجب عليك إدخال كلمة المرور'.tr;
                          } else {
                            return null;
                          }
                        },
                        controller: _.loginPassword,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: InkWell(
                      child: Text(
                        'هل نسيت كلمة المرور؟',
                        style: TextStyle(
                          fontSize: Get.width * 0.04,
                          color: Const.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _.login();
                          //  _.compositionSpecimen.findAllSpecimens();
                          },
                          child: const Text("دخول"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}