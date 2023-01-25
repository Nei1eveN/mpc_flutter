import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DataModule extends Module {
  @override
  List<Bind<Object>> get binds {
    return [
      Bind.factory<Dio>(
        (i) {
          return Dio(
            BaseOptions(
              baseUrl: 'https://reqres.in/api',
              connectTimeout: const Duration(seconds: 30).inMilliseconds,
              receiveTimeout: const Duration(seconds: 30).inMilliseconds,
              receiveDataWhenStatusError: true,
            ),
          )..interceptors.add(LogInterceptor());
        },
        export: true,
      ),
      Bind.singleton<ApiClient>(
        (i) => ApiClient(i()),
        export: true,
      ),
      Bind.singleton<DiaryRepository>(
        (i) => DiaryRepositoryImpl(i()),
        export: true,
      ),
    ];
  }
}
