import 'package:guia_moteis/modules/home/data/models/remote/mapper/places/home_place.dart';
import 'package:guia_moteis/modules/home/data/models/remote/response/app_response.dart';
import 'package:guia_moteis/modules/home/data/models/remote/service/home_service_model.dart';

import '../../../main.dart';
import 'models/remote/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _service = inject<HomeService>();

  @override
  Future<AppResponse<HomePlace?>> getPlaces() async {
    try {
      return await _service.getPlaces();
    } catch (e) {
      return AppResponse(
        success: false,
        response: null,
      );
    }
  }
}
