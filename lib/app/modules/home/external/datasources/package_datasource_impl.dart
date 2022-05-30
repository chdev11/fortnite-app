import 'package:dio/dio.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/package_error.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/package_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/package_model.dart';

class PackageDatasourceImpl implements IPackageDatasource {
  final Dio client;

  PackageDatasourceImpl(this.client);

  @override
  Future<List<Package>> fetchPackages() async {
    final result = await client.get('https://fortnite-api.com/v2/shop/br',
        queryParameters: {'language': 'pt-BR'},
        options: Options(headers: {
          'Authorization': '1f53725b-4121-4bb9-9610-7db4271f3614'
        }));
    if (result.statusCode == 200) {
      try {
        return (result.data['data']['featured']['entries'] as List)
            .map((e) => PackageModel.fromMap(e))
            .toList();
      } catch (e) {
        throw PackageNormalizeException(e.toString());
      }
    } else {
      throw PackageStatusCodeException('');
    }
  }
}
