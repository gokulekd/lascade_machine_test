import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://test.lascade.com/api/test'));

  Future<Response> fetchData() async {
    try {
      return await _dio.get("/list");
    } catch (e) {
      rethrow;
    }
  }
}