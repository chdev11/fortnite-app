import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/featured_model.dart';
import 'package:fortnite_app/app/modules/home/infra/repositories/featured_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class FeaturedDatasourceMock extends Mock implements IFeaturedDatasource {}

void main() {
  final datasource = FeaturedDatasourceMock();
  final repository = FeaturedRepositoryImpl(datasource);
  testWidgets('deve retornar uma lista de features', (tester) async {
    when(() => datasource.fetchFeatures())
        .thenAnswer((_) async => <FeaturedModel>[]);

    final result = await repository.fetchFeatures();
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Featured>>());
  });
}
