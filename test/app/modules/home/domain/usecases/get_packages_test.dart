import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/package_repository.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_packages.dart';
import 'package:mocktail/mocktail.dart';

class PackageRepositoryMock extends Mock implements IPackageRepository {}

void main() {
  final repository = PackageRepositoryMock();
  final getPackagesUsecase = GetPackages(repository);
  test('deve retornar uma lista de packages', () async {
    when(() => repository.fetchPackages())
        .thenAnswer((_) async => const Right(<Package>[]));

    final result = await getPackagesUsecase();
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Package>>());
  });
}
