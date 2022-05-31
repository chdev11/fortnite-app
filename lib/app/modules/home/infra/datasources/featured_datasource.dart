import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';

abstract class IFeaturedDatasource {
  Future<List<Featured>> fetchFeatures();
}
