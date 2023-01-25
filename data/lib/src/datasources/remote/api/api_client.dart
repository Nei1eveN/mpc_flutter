import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Either<T, Exception>> post<T>(
    String path,
    T Function(Map<String, dynamic>) mapper, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      return left(Result.fromResponse(response, mapper).data);
    } on DioError catch (exception) {
      return right(
        NetworkError<dynamic>(
          List.filled(
            1,
            ApiError(
              code: exception.response?.statusCode.toString() ?? '',
              message: exception.message,
            ),
          ),
        ),
      );
    }
  }
}
