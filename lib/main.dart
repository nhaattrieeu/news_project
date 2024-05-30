import 'package:flutter/cupertino.dart';

import 'core/app/app.dart';
import 'di/di.dart';

void main() async {
  await init();

  runApp(const MyApp());
}
