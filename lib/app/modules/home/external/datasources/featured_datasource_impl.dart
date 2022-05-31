import 'package:dio/dio.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/featured_error.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/featured_model.dart';
import 'package:fortnite_app/env.dart';
import 'package:fortnite_app/shared/clients/implementations/dio_client.dart';

class FeaturedDatasourceImpl implements IFeaturedDatasource {
  final DioClient client;

  FeaturedDatasourceImpl(this.client);

  @override
  Future<List<Featured>> fetchFeatures() async {
    final result = await client.get(baseUrl);
    if (result.statusCode == 200) {
      try {
        return (result.data['data']['featured']['entries'] as List)
            .map((e) => FeaturedModel.fromMap(e))
            .toList();
      } catch (e) {
        throw FeaturedNormalizeException(e.toString());
      }
    } else {
      throw FeaturedStatusCodeException('');
    }
  }
}
