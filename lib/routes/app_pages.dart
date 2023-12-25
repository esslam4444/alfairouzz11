import 'package:get/get.dart';

import '../controllers/HomeController.dart';
import '../controllers/LoginController.dart';
import '../controllers/SpecimenDetailsController.dart';
import '../controllers/SpecimenSearchController.dart';
import '../controllers/SpecimensController.dart';
import '../views/HomeView.dart';
import '../views/LoginView.dart';
import '../views/QRScannerView.dart';
import '../views/SpecimenDetailsView.dart';
import '../views/SpecimenSearchView.dart';
import '../views/SpecimensView.dart';

part 'app_routes.dart';

class AppPages {
  //static const INITIAL = Routes.LOGIN;
  static const INITIAL = Routes.SPECIMEN_SEARCH;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPECIMENS,
      page: () => SpecimensView(),
      binding: SpecimensBinding(),
    ),
    GetPage(
      name: _Paths.SPECIMEN_DETAILS,
      page: () => SpecimenDetailsView(),
      binding: SpecimenDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPECIMEN_SEARCH,
      page: () => SpecimenSearchView(),
      binding: SpecimenSearchBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCANNER,
      page: () => QRScannerView(),
    ),
  ];
}
