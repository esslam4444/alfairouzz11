import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/HomeController.dart';
import '../controllers/SpecimensController.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});


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
              title:Text(
              'العينات',
            //  textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
              actions: [ IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {

                  SystemNavigator.pop(); // Exit the application
                },
              ),]),
            body: Obx(()=>
               ListView.builder(
                itemCount: _.specimens.length,
                itemBuilder: (context, index) {
                  final specimen = index < _.specimens.length ? _.specimens[index] : null;
                  return Card(
                    child: ListTile(
                      title:    Text(specimen?.patient?.nameAr ?? '',style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:Text(specimen?.receivingDate.toString() ?? '') ,
                      trailing: Text('  ${specimen?.price.toString() ?? ''}  دينار'       ),

                      onTap: () {

                        // Handle onTap event
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
