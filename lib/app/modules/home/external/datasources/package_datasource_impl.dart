import 'package:dio/dio.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/package_error.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/package_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/models/package_model.dart';
import 'package:fortnite_app/env.dart';
import 'package:fortnite_app/shared/clients/implementations/dio_client.dart';

class PackageDatasourceImpl implements IPackageDatasource {
  final DioClient client;

  PackageDatasourceImpl(this.client);

  @override
  Future<List<Package>> fetchPackages() async {
    final result = await client.get(baseUrl);
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
