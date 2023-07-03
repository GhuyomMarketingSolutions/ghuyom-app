import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> postLogin() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.login);

  static Future<Response> postOnboarding({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.onboarding, data: jsonEncode(body));

  static Future<Response> postAddBusiness({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.addBusiness, data: jsonEncode(body));

  static Future<Response> addService(
          {required dynamic body, required String businessId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(
          '${Endpoints.addService}+$businessId/add',
          data: jsonEncode(body));

  ///Get API
  static Future<Response> getAllBusiness() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getAllBusiness);

  ///Delete API
  static Future<Response> deleteBusiness({required String businessId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .delete(Endpoints.deleteBusiness + businessId);
}
