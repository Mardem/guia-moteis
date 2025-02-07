import 'package:guia_moteis/main.dart';

import '../data/models/remote/service/home_service_model.dart';
import '../data/remote/service/home_service.dart';
import '../vm/home_viewmodel.dart';

void startHomeModule() {
  /// Services
  inject.registerFactory<HomeService>(() => HomeServiceImpl());

  /// Repositories

  /// ViewModels
  inject.registerSingleton<HomeViewmodel>(HomeViewmodel());
}
