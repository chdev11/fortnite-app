import 'package:dartz/dartz.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';

import '../errors/featured_error.dart';

abstract class IGetFeatures {
  Future<Either<FeaturedException, List<Featured>>> call();
}

class GetFeatures implements IGetFeatures {
  final IFeaturedRepository repository;

  GetFeatures(this.repository);

  @override
  Future<Either<FeaturedException, List<Featured>>> call() {
    return repository.fetchFeatures();
  }
}
