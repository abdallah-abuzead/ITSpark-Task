import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../app_routes/app_router.dart';

class AppLocale {
  static const Locale english = Locale('en', 'US');
  static const Locale arabic = Locale('ar', 'EG');

  static bool get isEnglish => AppRouter.currentContext!.locale == english;

  static toggleLocale() async {
    Get.updateLocale(isEnglish ? arabic : english);
    await AppRouter.currentContext!.setLocale(isEnglish ? arabic : english);
  }
}
