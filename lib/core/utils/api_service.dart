import 'package:cine_reserve_app/core/constant/strings.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final result = await _dio.get("$kBaseUrl$endPoint",
        options: Options(headers: {"Authorization": "Bearer $kToken"}));
    return result.data;
  }
}
