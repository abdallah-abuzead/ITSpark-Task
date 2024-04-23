import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_injections/app_injections.dart' as di;
import 'core/constants/app_locale.dart';
import 'core/constants/app_url.dart';
import 'core/screens/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  di.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocale.english, AppLocale.arabic],
      path: AppUrl.translations,
      startLocale: AppLocale.english,
      fallbackLocale: AppLocale.english,
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}
