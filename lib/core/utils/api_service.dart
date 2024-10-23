import 'package:dio/dio.dart';

class ApiService {
  final _apiKey = "AIzaSyCKNgxgJzruapaSuile-8T-9qnd5UJp4t0";
  final _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseUrl$endPoint&key=$_apiKey");
    return response.data;
  }

}
