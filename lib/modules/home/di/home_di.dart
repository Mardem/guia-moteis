import 'package:guia_moteis/main.dart';

import '../vm/home_viewmodel.dart';

void startHomeModule() {
  inject.registerSingleton<HomeViewmodel>(HomeViewmodel());
}
