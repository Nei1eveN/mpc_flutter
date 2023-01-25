import 'dart:io';

import 'package:fpdart/fpdart.dart';

abstract class DiaryRepository {
  Future<Either<Unit, Exception>> uploadImages(List<String> imagePaths);

  Future<File?> addImage();
}
