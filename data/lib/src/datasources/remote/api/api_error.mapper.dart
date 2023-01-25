// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'api_error.dart';

class ApiErrorMapper extends MapperBase<ApiError> {
  static MapperContainer container = MapperContainer(
    mappers: {ApiErrorMapper()},
  );

  @override
  ApiErrorMapperElement createElement(MapperContainer container) {
    return ApiErrorMapperElement._(this, container);
  }

  @override
  String get id => 'ApiError';

  static final fromMap = container.fromMap<ApiError>;
  static final fromJson = container.fromJson<ApiError>;
}

class ApiErrorMapperElement extends MapperElementBase<ApiError> {
  ApiErrorMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  ApiError decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  ApiError fromMap(Map<String, dynamic> map) => ApiError(
      code: container.$get(map, 'code'),
      message: container.$get(map, 'message'));

  @override
  Function get encoder => encode;
  dynamic encode(ApiError v) => toMap(v);
  Map<String, dynamic> toMap(ApiError a) => {
        'code': container.$enc(a.code, 'code'),
        'message': container.$enc(a.message, 'message')
      };

  @override
  String stringify(ApiError self) =>
      'ApiError(code: ${container.asString(self.code)}, message: ${container.asString(self.message)})';
  @override
  int hash(ApiError self) =>
      container.hash(self.code) ^ container.hash(self.message);
  @override
  bool equals(ApiError self, ApiError other) =>
      container.isEqual(self.code, other.code) &&
      container.isEqual(self.message, other.message);
}

mixin ApiErrorMappable {
  String toJson() => ApiErrorMapper.container.toJson(this as ApiError);
  Map<String, dynamic> toMap() =>
      ApiErrorMapper.container.toMap(this as ApiError);
  ApiErrorCopyWith<ApiError, ApiError, ApiError> get copyWith =>
      _ApiErrorCopyWithImpl(this as ApiError, $identity, $identity);
  @override
  String toString() => ApiErrorMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ApiErrorMapper.container.isEqual(this, other));
  @override
  int get hashCode => ApiErrorMapper.container.hash(this);
}

extension ApiErrorValueCopy<$R, $Out extends ApiError>
    on ObjectCopyWith<$R, ApiError, $Out> {
  ApiErrorCopyWith<$R, ApiError, $Out> get asApiError =>
      base.as((v, t, t2) => _ApiErrorCopyWithImpl(v, t, t2));
}

typedef ApiErrorCopyWithBound = ApiError;

abstract class ApiErrorCopyWith<$R, $In extends ApiError, $Out extends ApiError>
    implements ObjectCopyWith<$R, $In, $Out> {
  ApiErrorCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ApiError>(
      Then<ApiError, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? code, String? message});
}

class _ApiErrorCopyWithImpl<$R, $Out extends ApiError>
    extends CopyWithBase<$R, ApiError, $Out>
    implements ApiErrorCopyWith<$R, ApiError, $Out> {
  _ApiErrorCopyWithImpl(super.value, super.then, super.then2);
  @override
  ApiErrorCopyWith<$R2, ApiError, $Out2> chain<$R2, $Out2 extends ApiError>(
          Then<ApiError, $Out2> t, Then<$Out2, $R2> t2) =>
      _ApiErrorCopyWithImpl($value, t, t2);

  @override
  $R call({String? code, String? message}) => $then(
      ApiError(code: code ?? $value.code, message: message ?? $value.message));
}
