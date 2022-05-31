import 'package:flutter_modular/flutter_modular.dart';
import 'package:fortnite_app/app/modules/home/domain/repositories/featured_repository.dart';
import 'package:fortnite_app/app/modules/home/domain/usecases/get_features.dart';
import 'package:fortnite_app/app/modules/home/external/datasources/featured_datasource_impl.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';
import 'package:fortnite_app/app/modules/home/infra/repositories/featured_repository_impl.dart';
import 'package:fortnite_app/shared/clients/implementations/dio_client.dart';
import 'presenter/stores/home_store.dart';

import 'presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FeaturedDatasourceImpl(i<DioClient>())),
    Bind.lazySingleton((i) => FeaturedRepositoryImpl(i<IFeaturedDatasource>())),
    Bind.lazySingleton((i) => GetFeatures(i<IFeaturedRepository>())),
    Bind.lazySingleton((i) => HomeStore(i<IGetFeatures>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
