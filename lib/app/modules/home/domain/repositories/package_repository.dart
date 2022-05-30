import 'package:dartz/dartz.dart';

import '../../errors/package_error.dart';
import '../entities/package.dart';

abstract class IPackageRepository {
  Future<Either<PackageException, List<Package>>> fetchPackages();
}
