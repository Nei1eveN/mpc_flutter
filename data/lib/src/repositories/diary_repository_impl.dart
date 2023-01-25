import 'dart:io';

import 'package:data/data.dart';
import 'package:domain/domain.dart' hide Either, Unit;
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class DiaryRepositoryImpl extends DiaryRepository {
  final ApiClient _client;

  DiaryRepositoryImpl(this._client);

  @override
  Future<Either<Unit, Exception>> uploadImages(List<String> imagePaths) {
    return _client.post(
      '/users',
      (p0) => unit,
      data: imagePaths.map((e) => {'image': e}).toList(),
    );
  }

  @override
  Future<File?> addImage() async {
    final picker = ImagePicker();
    final result = await picker.getImage(source: ImageSource.gallery);

    if (result != null) {
      return File(result.path);
    }

    return null;
  }
}
