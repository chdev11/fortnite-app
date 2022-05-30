import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/package_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/package_model.dart';
import 'package:fortnite_app/app/modules/home/infra/repositories/package_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class PackageDatasourceMock extends Mock implements IPackageDatasource {}

void main() {
  final datasource = PackageDatasourceMock();
  final repository = PackageRepositoryImpl(datasource);
  testWidgets('deve retornar uma lista de packages', (tester) async {
    when(() => datasource.fetchPackages())
        .thenAnswer((_) async => <PackageModel>[]);

    final result = await repository.fetchPackages();
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Package>>());
  });
}
