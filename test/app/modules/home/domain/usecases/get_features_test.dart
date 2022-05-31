import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_features.dart';
import 'package:mocktail/mocktail.dart';

class FeaturedRepositoryMock extends Mock implements IFeaturedRepository {}

void main() {
  final repository = FeaturedRepositoryMock();
  final getFeaturesUsecase = GetFeatures(repository);
  test('deve retornar uma lista de features', () async {
    when(() => repository.fetchFeatures())
        .thenAnswer((_) async => const Right(<Featured>[]));

    final result = await getFeaturesUsecase();
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Featured>>());
  });
}
