import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Result<T> {
  Result(this.data);
  final T data;

  static const String _jsonNodeData = 'data';
  static const String _jsonNodeErrors = 'errors';

  static Result<T> fromResponse<T>(
    Response<dynamic> response,
    T Function(Map<String, dynamic>) mapper,
  ) {
    final responseData = response.data;

    if (responseData[_jsonNodeErrors] != null) {
      return ServerError.fromResponse(response);
    }

    if (responseData[_jsonNodeData] != null ||
        responseData[_jsonNodeData] == null &&
            responseData.toString().isNotEmpty) {
      return Result(
        mapper(responseData[_jsonNodeData] != null
            ? response.data[_jsonNodeData]
            : responseData),
      );
    }

    return InternalError();
  }
}

extension ResultExtensions<T> on Result<T> {
  void when({
    required ValueChanged<T> onSuccess,
    required ValueChanged<ServerError<T>> onServerError,
    required ValueChanged<NetworkError<T>> onNetworkError,
    required ValueChanged<InternalError<T>> onInternalError,
  }) {
    final result = this;

    if (result is ServerError<T>) {
      return onServerError.call(result);
    }

    if (result is NetworkError<T>) {
      return onNetworkError.call(result);
    }

    if (result is InternalError<T>) {
      return onInternalError.call(result);
    }

    return onSuccess.call(result.data);
  }
}

class Failed<T> extends Result<T> implements Exception {
  Failed(this.errors) : super(T as T);
  List<ApiError> errors;
}

class ServerError<T> extends Failed<T> {
  ServerError(List<ApiError> errors) : super(errors);
  static const String _jsonNodeErrors = 'errors';

  static ServerError<T> fromResponse<T>(Response<dynamic> response) {
    return ServerError((response.data[_jsonNodeErrors] as List).map((e) {
      final response = ApiErrorMapper.fromJson(e);
      return response;
    }).toList());
  }
}

class NetworkError<T> extends Failed<T> {
  NetworkError(List<ApiError> errors) : super(errors);
}

class InternalError<T> extends Failed<T> {
  InternalError() : super(List.empty());
}
