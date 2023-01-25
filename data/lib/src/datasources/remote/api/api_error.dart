import 'package:dart_mappable/dart_mappable.dart';

part 'api_error.mapper.dart';

@MappableClass()
class ApiError with ApiErrorMappable {
  const ApiError({required this.code, required this.message});
  @MappableField(key: 'code')
  final String code;
  @MappableField(key: 'message')
  final String message;
}
