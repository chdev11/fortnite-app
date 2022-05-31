import 'package:dartz/dartz.dart';

import '../entities/featured.dart';
import '../errors/featured_error.dart';

abstract class IFeaturedRepository {
  Future<Either<FeaturedException, List<Featured>>> fetchFeatures();
}
