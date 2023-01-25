import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mpc_flutter/src/features/diary/diary.dart';

class MockUploadImages extends Mock implements UploadImages {}

class MockAddImage extends Mock implements AddImage {}

void main() {
  late UploadImages uploadImages;
  late AddImage addImage;
  late DiaryCubit cubit;

  setUp(() {
    uploadImages = MockUploadImages();
    addImage = MockAddImage();
    cubit = DiaryCubit(uploadImages, addImage);
  });

  test(
    'When adding image from list of images, state should emit new state with updated list of images',
    () async {
      when(() => addImage(unit)).thenAnswer(
        (invocation) async => left(File('one')),
      );

      await cubit.addImage();

      final imagePaths = cubit.state.imagePaths.map((e) => e.path);

      expectLater(imagePaths, <String>['one']);
    },
  );

  test(
    'When remove image from list of images, state should emit new state with updated list of images',
    () async {
      when(() => addImage(unit)).thenAnswer(
        (invocation) async => left(File('one')),
      );

      await cubit.addImage();

      var state = cubit.state;

      expect(state.imagePaths.map((e) => e.path).toList(), ['one']);

      await cubit.removeImage(File('one'));

      state = cubit.state;

      expect(state.imagePaths.map((e) => e.path).toList(), []);
    },
  );

  test(
    'When uploading images, state should emit based on Left Either',
    () async {
      registerFallbackValue(UploadImagesParams([]));
      when(() => uploadImages(any()))
          .thenAnswer((invocation) async => left(unit));

      expectLater(
        cubit.stream,
        emitsInOrder(
          [
            cubit.state.copyWith(isLoading: true),
            cubit.state.copyWith(isLoading: false),
          ],
        ),
      );

      cubit.uploadImages([]);
    },
  );

  test(
    'When uploading images, state should emit based on Right Either',
    () async {
      final throwable = Exception('error');
      registerFallbackValue(UploadImagesParams([]));
      when(() => uploadImages(any())).thenAnswer(
        (invocation) async => right(throwable),
      );

      expectLater(
        cubit.stream,
        emitsInOrder(
          [
            cubit.state.copyWith(isLoading: true),
            cubit.state.copyWith(isLoading: false, uploadError: throwable),
          ],
        ),
      );

      cubit.uploadImages([]);
    },
  );
}
