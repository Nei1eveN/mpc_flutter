import 'dart:io';

import 'package:domain/domain.dart';

class AddImage extends BaseUseCase<File?, Unit> {
  final DiaryRepository _repository;

  AddImage(this._repository);

  @override
  Future<Either<File?, Exception>> call(Unit params) async {
    final response = await _repository.addImage();
    return left(response);
  }
}
