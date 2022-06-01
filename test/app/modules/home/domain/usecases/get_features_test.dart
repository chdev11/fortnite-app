import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/featured_error.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_features.dart';
import 'package:mocktail/mocktail.dart';

class FeaturedRepositoryMock extends Mock implements IFeaturedRepository {}

void main() {
  late IFeaturedRepository repository;
  late IGetFeatures usecase;

  setUp(() {
    repository = FeaturedRepositoryMock();
    usecase = GetFeatures(repository);
  });

  test('should return a list of features', () async {
    when(() => repository.fetchFeatures())
        .thenAnswer((_) async => const Right(<Featured>[]));

    final future = usecase();

    expect(future, completes);

    final result = await future;

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Featured>>());
  });

  test('should return a featured datasource exception', () async {
    when(() => repository.fetchFeatures())
        .thenAnswer((_) async => Left(FeaturedDatasourceException('')));

    final future = usecase();

    expect(future, completes);

    final result = await future;

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<FeaturedDatasourceException>());
  });
}
