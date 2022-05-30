import 'package:dartz/dartz.dart';

import '../entities/package.dart';
import '../errors/package_error.dart';

abstract class IPackageRepository {
  Future<Either<PackageException, List<Package>>> fetchPackages();
}
