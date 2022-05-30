import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';

abstract class IPackageDatasource {
  Future<List<Package>> fetchPackages();
}
