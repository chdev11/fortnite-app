import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:dartz/dartz.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';

import '../../domain/errors/featured_error.dart';

class FeaturedRepositoryImpl implements IFeaturedRepository {
  final IFeaturedDatasource datasource;

  FeaturedRepositoryImpl(this.datasource);

  @override
  Future<Either<FeaturedException, List<Featured>>> fetchFeatures() async {
    try {
      final result = await datasource.fetchFeatures();
      return Right(result);
    } catch (e) {
      return Left(FeaturedDatasourceException(e.toString()));
    }
  }
}
