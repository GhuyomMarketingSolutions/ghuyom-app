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
          '${Endpoints.addService}$businessId/add',
          data: jsonEncode(body));

  static Future<Response> addMultiplePhotos({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(
          Endpoints.addMultiplePhotos,
          data: body,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  static Future<Response> addSinglePhoto({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(
          Endpoints.addSinglePhoto,
          data: body,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}));

  ///Get API
  static Future<Response> getABusiness({required String businessId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getABusiness + businessId);

  static Future<Response> getOwnerBusiness() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.getAllBusiness, queryParameters: {'isOwner': true});

  static Future<Response> getCategoryBusiness(
          {required String category}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(
          Endpoints.getAllBusinessNoAuth,
          queryParameters: {'category': category});

  static Future<Response> getAllServices({required String businessId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get('${Endpoints.getAllServices}$businessId/all');

  static Future<Response> getSearchResult(
          {required String keyword,
          required String latitude,
          required String longitude}) async =>
      await DioClient(Dio(), showSnakbar: true)
          .get(Endpoints.getSearchResult, queryParameters: {
        'search': keyword,
        'latitude': latitude,
        'longitude': longitude,
        'radius': '5',
      });

  ///Delete API
  static Future<Map<String, dynamic>> deleteBusiness(
          {required String businessId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .delete(Endpoints.deleteBusiness + businessId);

  static Future<Map<String, dynamic>> deleteService(
          {required String serviceId}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .delete(Endpoints.deleteService + serviceId);

  ///Put API
  static Future<Response> putBusiness(
          {required String businessId, required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .put(Endpoints.putBusiness + businessId, data: jsonEncode(body));

  static Future<Response> putUpdateUser({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .put(Endpoints.putUpdateUser, data: jsonEncode(body));
}
