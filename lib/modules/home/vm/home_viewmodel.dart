import '../../../core/vm/base_view_model.dart';
import '../../../main.dart';
import '../data/models/remote/mapper/places/home_place.dart';
import '../data/models/remote/repository/home_repository.dart';
import '../data/models/remote/response/app_response.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeRepository repository = inject<HomeRepository>();

  Future<void> loadItems() async {
    setLoading(true);

    AppResponse<HomePlace?> places = await repository.getPlaces();

    if (places.success) {
      logger.i(places.response?.data.moteis.first.name ?? 'asdfasdf');
    }

    setLoading(false);
  }
}
