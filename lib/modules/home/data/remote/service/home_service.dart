import 'package:dio/dio.dart';
import 'package:guia_moteis/main.dart';

import '../../../../../core/http/client.dart';
import '../../models/remote/mapper/places/home_place.dart';
import '../../models/remote/response/app_response.dart';
import '../../models/remote/service/home_service_model.dart';

class HomeServiceImpl implements HomeService {
  final HttpClient _client = inject<HttpClient>();

  @override
  Future<AppResponse<HomePlace?>> getPlaces() async {
    try {
      final Response<Map<String, dynamic>> response = await _client.get(
        '/places',
      );

      var content = response.data!;
      final HomePlace places = HomePlace.fromJson(content);

      return AppResponse(
        success: places.success,
        response: places,
      );
    } catch (e) {
      throw Exception('Houve um problema ao buscar os dados de locais!');
    }
  }
}
