import 'package:guia_moteis/core/http/client.dart';
import 'package:guia_moteis/main.dart';
import 'package:guia_moteis/modules/home/di/home_di.dart';

void startModules() {
  startHomeModule();

  inject.registerSingleton<HttpClient>(HttpClientImpl());
}
