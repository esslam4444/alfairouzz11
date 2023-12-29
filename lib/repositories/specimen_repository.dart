import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../models/specimen_model.dart';



class SpecimenRepository {

  final _dio = Get.find<Dio>();

  // final String pdfUrl = "https://app.alfairouz.ly/api/public/specimen/report-colored/$specimenId";

  Future<Specimen> findBySpecimenLabQr(String labQr) async {
    try {
      final response = await _dio.get(
          'https://app.alfairouz.ly/api/public/specimen/by-qr/$labQr'

      );
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


  Future<Specimen> findBySpecimenId() async {
    try {
      final response = await _dio.get(
          'https://app.alfairouz.ly/api/public/specimen/report-colored/1');
      return Specimen.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }


}