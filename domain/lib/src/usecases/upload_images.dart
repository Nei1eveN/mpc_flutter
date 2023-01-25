import 'dart:convert';
import 'dart:io';

import 'package:domain/src/repositories/repositories.dart';
import 'package:domain/src/usecases/usecases.dart';
import 'package:fpdart/fpdart.dart';

class UploadImages extends BaseUseCase<Unit, UploadImagesParams> {
  final DiaryRepository _repository;

  UploadImages(this._repository);

  @override
  Future<Either<Unit, Exception>> call(UploadImagesParams params) async {
    final imagePaths = (params.images.map((e) {
      final imageBytes = e.readAsBytesSync();
      return base64Encode(imageBytes);
    }).toList());
    return _repository.uploadImages(imagePaths);
  }
}

class UploadImagesParams {
  final List<File> images;

  UploadImagesParams(this.images);
}
