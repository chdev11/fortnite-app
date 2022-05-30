import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:dartz/dartz.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/package_repository.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/package_datasource.dart';

import '../../domain/errors/package_error.dart';

class PackageRepositoryImpl implements IPackageRepository {
  final IPackageDatasource datasource;

  PackageRepositoryImpl(this.datasource);

  @override
  Future<Either<PackageException, List<Package>>> fetchPackages() async {
    try {
      final result = await datasource.fetchPackages();
      return Right(result);
    } catch (e) {
      return Left(PackageDatasourceException(e.toString()));
    }
  }
}
