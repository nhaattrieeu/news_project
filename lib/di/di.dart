import 'package:get_it/get_it.dart';
import 'package:news_project/di/explore.dart';
import 'package:news_project/di/news_detail.dart';

import 'common.dart';
import 'news.dart';

final sl = GetIt.instance;

Future<void> init() async {
  registerNewsFeature();
  registerNewsDetailFeature();
  registerExploreFeature();

  registerCommonDependence();
}
