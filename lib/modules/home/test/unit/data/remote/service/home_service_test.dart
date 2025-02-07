import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/http/client.dart';
import 'package:guia_moteis/core/test/mocks/http_client_mock.dart';
import 'package:guia_moteis/main.dart';
import 'package:guia_moteis/modules/home/data/models/remote/response/app_response.dart';
import 'package:guia_moteis/modules/home/data/models/remote/service/home_service_model.dart';
import 'package:guia_moteis/modules/home/data/remote/service/home_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/services/home_service_fixture.dart';

void main() {
  group(
    'Testing Home Service Request With Success',
    () {
      late HomeService service;
      late HttpClient mockClient;

      setUpAll(
        () {
          registerFallbackValue(MockRequestOptions());

          inject.registerFactory<HttpClient>(() => mockClient);
          mockClient = HttpClientMock();
          service = HomeServiceImpl();
        },
      );

      tearDownAll(
        () {
          inject.unregister<HttpClient>();
        },
      );

      test(
        'Given get home places, When call get places, Then return home places',
        () async {
          // Arrange
          when(
            () => mockClient.get<Map<String, dynamic>>(any(),
                baseUrl: any(named: 'baseUrl'),
                queryParameters: any(named: 'queryParameters'),
                options: any(named: 'options')),
          ).thenAnswer(
            (_) async {
              return Response<Map<String, dynamic>>(
                requestOptions: RequestOptions(path: '/places'),
                data: HomeServiceFixture.validPlaceResponse,
                statusCode: 200,
              );
            },
          );

          // Act
          final response = await service.getPlaces();

          // Assert
          expect(response.success, true);
          expect(response, isA<AppResponse>());
          expect(response.response!.data.moteis, isNotEmpty);

          verify(() => mockClient.get<Map<String, dynamic>>(
                any(),
                baseUrl: any(named: 'baseUrl'),
                queryParameters: any(named: 'queryParameters'),
                options: any(named: 'options'),
              )).called(1);
        },
      );
    },
  );

  group(
    'Testing Home Service Request With Error',
    () {
      late HomeService service;
      final HttpClient mockClient = HttpClientMock();

      setUpAll(
        () {
          inject.registerFactory<HttpClient>(() => mockClient);
          service = HomeServiceImpl();
        },
      );

      tearDownAll(
        () {
          inject.unregister<HttpClient>();
        },
      );

      test(
        'Given empty response, When getPlaces is called, Then throw Exception',
        () async {
          // Arrange
          when(() => mockClient.get(any())).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(path: ''),
              data: {},
            ),
          );

          // Act & Assert
          expect(
            () async => await service.getPlaces(),
            throwsA(isA<Exception>()),
          );

          verify(() => mockClient.get<Map<String, dynamic>>(
                any(),
                baseUrl: any(named: 'baseUrl'),
                queryParameters: any(named: 'queryParameters'),
                options: any(named: 'options'),
              )).called(1);
        },
      );
    },
  );
}
