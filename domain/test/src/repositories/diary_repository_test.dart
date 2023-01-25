import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDiaryRepository extends Mock implements DiaryRepository {}

void main() {
  late DiaryRepository repository;

  setUp(() {
    repository = MockDiaryRepository();
  });

  test('When uploadImages is called, it should return Right Either', () async {
    final throwable = Exception('error message');
    when(() => repository.uploadImages(any())).thenAnswer(
      (invocation) async => right(throwable),
    );

    final response = await repository.uploadImages([]);

    expect(response, right(throwable));
  });

  test('When uploadImages is called, it should return Left Either', () async {
    when(() => repository.uploadImages(any())).thenAnswer(
      (invocation) async => left(unit),
    );

    final response = await repository.uploadImages([]);

    expect(response, left(unit));
  });
}
