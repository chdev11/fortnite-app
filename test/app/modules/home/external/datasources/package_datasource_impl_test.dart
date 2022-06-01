import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/domain/errors/featured_error.dart';
import 'package:fortnite_app/app/modules/home/external/datasources/featured_datasource_impl.dart';
import 'package:fortnite_app/app/modules/home/infra/datasources/featured_datasource.dart';
import 'package:fortnite_app/app/modules/home/utils/featured_200.dart';
import 'package:fortnite_app/app/modules/home/utils/featured_400.dart';
import 'package:fortnite_app/app/modules/home/utils/featured_401.dart';
import 'package:fortnite_app/shared/clients/implementations/dio_client.dart';
import 'package:mocktail/mocktail.dart';

class DioClientMock extends Mock implements DioClient {}

void main() {
  late DioClient client;
  late IFeaturedDatasource datasource;

  setUp(() {
    client = DioClientMock();
    datasource = FeaturedDatasourceImpl(client);
  });

  testWidgets('should return a list of features', (tester) async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(featured200),
        ));

    final future = datasource.fetchFeatures();

    expect(future, completes);

    final result = await future;

    expect(result, isA<List<Featured>>());
  });

  testWidgets('should return a featured normalize exception', (tester) async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: {},
        ));

    final future = datasource.fetchFeatures();

    expect(future, throwsA(isA<FeaturedNormalizeException>()));
  });

  testWidgets('should return a featured invalid or missing param exception',
      (tester) async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(featured400),
        ));

    final future = datasource.fetchFeatures();

    expect(future, throwsA(isA<FeaturedInvalidOrMissingParamException>()));
  });

  testWidgets('should return a featured unauthorized exception',
      (tester) async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: ''),
          data: jsonDecode(featured401),
        ));

    final future = datasource.fetchFeatures();

    expect(future, throwsA(isA<FeaturedUnauthorizedException>()));
  });

  testWidgets('should return a featured bad request exception', (tester) async {
    when(() => client.get(any())).thenAnswer((_) async => Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
          data: {},
        ));

    final future = datasource.fetchFeatures();

    expect(future, throwsA(isA<FeaturedBadRequestException>()));
  });
}
