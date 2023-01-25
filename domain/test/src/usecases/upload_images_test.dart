import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUploadImages extends Mock implements UploadImages {}

void main() {
  late UploadImages uploadImages;

  setUp(() {
    uploadImages = MockUploadImages();
  });

  test(
    'When UploadImages use case is called, it should return Right Either',
    () async {
      registerFallbackValue(UploadImagesParams([]));
      final throwable = Exception('error');
      when(() => uploadImages(any())).thenAnswer(
        (invocation) async => right(throwable),
      );

      final response = await uploadImages(UploadImagesParams([]));

      expect(response, right(throwable));
    },
  );

  test(
    'When UploadImages use case is called, it should return Left Either',
    () async {
      registerFallbackValue(UploadImagesParams([]));
      when(() => uploadImages(any())).thenAnswer(
        (invocation) async => left(unit),
      );

      final response = await uploadImages(UploadImagesParams([]));

      expect(response, left(unit));
    },
  );
}
