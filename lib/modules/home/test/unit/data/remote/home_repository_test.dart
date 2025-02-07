import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/main.dart';
import 'package:guia_moteis/modules/home/data/home_repository.dart';
import 'package:guia_moteis/modules/home/data/models/remote/mapper/places/home_place.dart';
import 'package:guia_moteis/modules/home/data/models/remote/repository/home_repository.dart';
import 'package:guia_moteis/modules/home/data/models/remote/response/app_response.dart';
import 'package:guia_moteis/modules/home/data/models/remote/service/home_service_model.dart';
import 'package:guia_moteis/modules/home/test/mocks/data/remote/service/home_service_mock.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/services/home_service_fixture.dart';

void main() {
  group('Testing Home Repository With Success', () {
    late HomeService service;
    late HomeRepository repository;

    setUpAll(
      () {
        service = HomeServiceMock();
        inject.registerFactory<HomeService>(() => service);

        repository = HomeRepositoryImpl();
      },
    );

    tearDownAll(
      () {
        inject.unregister<HomeService>();
      },
    );

    test(
      'Given get home places, When call get places, Then return app response with places',
      () async {
        // Arrange
        final AppResponse<HomePlace?> appResponse = AppResponse(
          success: true,
          response: HomePlace.fromJson(HomeServiceFixture.validPlaceResponse),
        );

        when(
          () => service.getPlaces(),
        ).thenAnswer((_) async => appResponse);

        // Act
        final response = await repository.getPlaces();

        // Assert
        expect(response.success, true);
        expect(response, isA<AppResponse>());
        expect(response.response!.data.moteis, isNotEmpty);

        verify(() => service.getPlaces()).called(1);
      },
    );
  });

  group('Testing Home Repository With Error', () {
    late HomeService service;
    late HomeRepository repository;

    setUpAll(
      () {
        service = HomeServiceMock();
        inject.registerFactory<HomeService>(() => service);

        repository = HomeRepositoryImpl();
      },
    );

    tearDownAll(
      () {
        inject.unregister<HomeService>();
      },
    );

    test(
      'Given get home places, When call get places, Then return empty app response',
      () async {
        // Arrange
        when(
          () => service.getPlaces(),
        ).thenThrow(
          Exception('Houve um problema ao buscar os dados de locais!'),
        );

        // Act
        final response = await repository.getPlaces();

        // Assert
        expect(response.success, false);
        expect(response, isA<AppResponse>());
        expect(response.response, isNull);

        verify(() => service.getPlaces()).called(1);
      },
    );
  });
}
