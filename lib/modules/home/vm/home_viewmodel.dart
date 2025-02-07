import '../../../core/vm/base_view_model.dart';
import '../../../main.dart';
import '../data/models/remote/mapper/places/home_place.dart';
import '../data/models/remote/response/app_response.dart';
import '../data/models/remote/service/home_service_model.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeService service = inject<HomeService>();

  Future<void> loadItems() async {
    setLoading(true);

    AppResponse<HomePlace?> places = await service.getPlaces();

    if (places.success) {
      logger.i(places.response?.data.moteis.first.name ?? 'asdfasdf');
    }

    setLoading(false);
  }
}
