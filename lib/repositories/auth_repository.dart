import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/login.dart';
import '../utils/consts.dart';

class AuthRepository {
  final _dio = Get.find<Dio>();

  Future<bool> authorize(LoginVM login) async {
    try {
      final response = await _dio.post('authenticate', data: login.toJson());
      if (response.data.containsKey('id_token')) {
        await Get.find<GetStorage>().write("id_token", response.data['id_token']);
      }
      return true;
    } on DioError catch (e) {
      Get.back();
      if (e.response!.statusCode == 401 || e.response!.statusCode == 400) {
        Get.snackbar('خطأ في التسجيل الدخول', 'البريد الإلكتروني/رمز السري خاطئ',
            titleText: null, backgroundColor: Const.primaryColor.withOpacity(0.4), colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
      }
      return false;
    }
  }

  Future<int?> isAuthenticated() async {
    try {
      final response = await _dio.get('authenticate',);
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
