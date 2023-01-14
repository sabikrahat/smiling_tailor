import 'package:beamer/beamer.dart' show Beamer;
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show SystemChrome;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart' show MyApp;
import 'src/constants/constants.dart';
import 'src/db/functions.dart';
import 'src/theme/themes/themes.dart';

Future<void> main() async {
  await _init();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _init() async {
  Beamer.setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('.${appName.toLowerCase()}');
  HiveFuntions.registerHiveAdepters();
  await HiveFuntions.openAllBoxes();
  SystemChrome.setSystemUIOverlayStyle(uiConfig);
}
