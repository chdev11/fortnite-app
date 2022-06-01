import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/featured_error.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/featured_model.dart';
import 'package:fortnite_app/app/modules/home/infra/repositories/featured_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class FeaturedDatasourceMock extends Mock implements IFeaturedDatasource {}

void main() {
  late IFeaturedDatasource datasource;
  late IFeaturedRepository repository;

  setUp(() {
    datasource = FeaturedDatasourceMock();
    repository = FeaturedRepositoryImpl(datasource);
  });

  testWidgets('should return a list of features', (tester) async {
    when(() => datasource.fetchFeatures())
        .thenAnswer((_) async => <FeaturedModel>[]);

    final future = repository.fetchFeatures();

    expect(future, completes);

    final result = await future;

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Featured>>());
  });

  testWidgets('should return a featured exception', (tester) async {
    when(() => datasource.fetchFeatures())
        .thenThrow(FeaturedUnauthorizedException(''));

    final future = repository.fetchFeatures();

    expect(future, completes);

    final result = await future;

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<FeaturedException>());
  });
}
