import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class DiaryCubit extends Cubit<DiaryState> {
  final UploadImages _uploadImages;
  final AddImage _addImage;

  DiaryCubit(
    this._uploadImages,
    this._addImage,
  ) : super(DiaryState.initial());

  Future<void> addImage() async {
    final result = (await _addImage(unit)).getLeft().toNullable();

    if (result != null) {
      final currentImages = state.imagePaths;
      final newList = <File>[];
      if (currentImages.isNotEmpty) {
        newList.addAll(currentImages);
      }
      newList.add(File(result.path));
      emit(state.copyWith(imagePaths: newList));
    }
  }

  Future<void> removeImage(File image) async {
    final currentImages = state.imagePaths;
    final newList = <File>[];
    newList.addAll(currentImages);
    newList.removeWhere((element) => element.path.contains(image.path));
    emit(state.copyWith(imagePaths: newList));
  }

  Future<void> uploadImages(List<File> images) async {
    emit(state.copyWith(isLoading: true));
    final response = await _uploadImages(UploadImagesParams(images));
    response.fold(
      (l) => emit(state.copyWith(isLoading: false)),
      (r) => emit(state.copyWith(isLoading: false, uploadError: r)),
    );
  }
}
