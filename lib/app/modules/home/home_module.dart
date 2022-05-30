import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/package_repository.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_packages.dart';
import 'package:fortnite_app/app/modules/home/external/datasources/package_datasource_impl.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/package_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/repositories/package_repository_impl.dart';
import 'presenter/stores/home_store.dart';

import 'presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PackageDatasourceImpl(Dio())),
    Bind.lazySingleton((i) => PackageRepositoryImpl(i<IPackageDatasource>())),
    Bind.lazySingleton((i) => GetPackages(i<IPackageRepository>())),
    Bind.lazySingleton((i) => HomeStore(i<IGetPackages>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
