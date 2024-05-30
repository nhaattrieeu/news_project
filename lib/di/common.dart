import 'package:dio/dio.dart';

import 'di.dart';

void registerCommonDependence() {
  sl.registerLazySingleton<Dio>(() => Dio());
}
