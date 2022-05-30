import 'package:dartz/dartz.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/package_repository.dart';
import 'package:fortnite_app/app/modules/home/errors/package_error.dart';

abstract class IGetPackages {
  Future<Either<PackageException, List<Package>>> call();
}

class GetPackages implements IGetPackages {
  final IPackageRepository repository;

  GetPackages(this.repository);

  @override
  Future<Either<PackageException, List<Package>>> call() {
    return repository.fetchPackages();
  }
}
