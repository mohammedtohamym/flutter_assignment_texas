import 'package:dio/dio.dart';
import 'package:flutter_assignment_texas/core/api/api_constants.dart';

class ApiManager {
  final Dio dio = Dio();

  Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.baseUrl + endpoint,
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => true,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
