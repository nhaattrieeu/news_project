import 'package:dio/dio.dart';

import 'di.dart';

void registerCommonDependence() {
  //network
  sl.registerLazySingleton<Dio>(() => Dio());
}
