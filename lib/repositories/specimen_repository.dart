import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../models/specimen_model.dart';



class SpecimenRepository {

  final _dio = Get.find<Dio>();

  // final String pdfUrl = "https://app.alfairouz.ly/api/public/specimen/report-colored/$specimenId";

  Future<Specimen> findBySpecimenLabQr(String labQr,
     // String firebaseToken
      ) async {
    try {
      final response = await _dio.get(
          'https://app.alfairouz.ly/api/public/specimen/by-qr/$labQr'
      );
      // final response = await _dio.post(
      //     'https://app.alfairouz.ly/api/public/specimen/by-qr-mobile/',
      //     queryParameters: {
      //       "labQr": labQr,
      //       "firebaseToken": firebaseToken,
      //     }
      // );
      return Specimen.fromJson(response.data);

    } catch (e) {
      rethrow;
    }

  }


  Future<List<Specimen>> findAllSpecimen() async {
    try {
      Map<String, dynamic> queryParam = {};
      queryParam['size'] = 100;
      queryParam['sort'] = 'id,desc';
      final response = await _dio.get('specimen', queryParameters: queryParam);
      final data = response.data as List;

      return List<Specimen>.from(data.map((e) => Specimen.fromJson(e)));
    } catch (e) {
      rethrow;
    }
  }


  Future<Specimen> findBySpecimenId(RxInt specimenId) async {
    try {
      final response = await _dio.get('specimen/$specimenId'
          //'https://app.alfairouz.ly/api/public/specimen/report-colored/1707'
      );
      return Specimen.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }


}