import 'package:rxdart/rxdart.dart';

import '../../../core/vm/base_view_model.dart';
import '../../../main.dart';
import '../data/models/remote/mapper/places/home_place.dart';
import '../data/models/remote/repository/home_repository.dart';
import '../data/models/remote/response/app_response.dart';

class HomeViewmodel extends BaseViewModel {
  final HomeRepository repository = inject<HomeRepository>();

  final BehaviorSubject<HomePlace?> _places = BehaviorSubject<HomePlace>();

  Stream<HomePlace?> get places => _places.stream;

  void setPlaces(HomePlace? value) => _places.add(value);

  Future<void> loadItems() async {
    setLoading(true);

    AppResponse<HomePlace?> places = await repository.getPlaces();

    if (places.success) {
      setPlaces(places.response);
    }

    setLoading(false);
  }

  @override
  void dispose() {
    _places.close();
    super.dispose();
  }
}
