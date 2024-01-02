
import 'package:alfairouzz1/utils/material_swatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';
import 'utils/consts.dart';
import 'utils/dependency_injection.dart';


Future<void> main() async {
  DependencyInjection.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      title: "مختبر الفيروز",
      themeMode: ThemeMode.light,
      theme: ThemeData.from(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'JF-Flat'),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Const.primaryColor.toMaterialColor(),
            brightness: Brightness.light,
            cardColor: Colors.white,
            accentColor: Const.primaryLightColor,
            errorColor: Colors.red,
            backgroundColor: Colors.white
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
