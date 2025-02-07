import '../mapper/places/home_place.dart';
import '../response/app_response.dart';

abstract interface class HomeRepository {
  Future<AppResponse<HomePlace?>> getPlaces();
}
