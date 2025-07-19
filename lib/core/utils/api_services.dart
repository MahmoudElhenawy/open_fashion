import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.escuelajs.co/api/v1/';

  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
