import 'package:flutter_modular/flutter_modular.dart';
import 'package:fortnite_app/env.dart';
import 'package:fortnite_app/shared/clients/implementations/dio_client.dart';
import 'package:fortnite_app/shared/clients/interceptors/auth_interceptor.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioClient(
        baseUrl: baseUrl,
        interceptors: [AuthInterceptor(apiSecret, apiLanguage)]))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
