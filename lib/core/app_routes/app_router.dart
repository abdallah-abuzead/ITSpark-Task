import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? currentContext = navigatorKey.currentContext;

  static to(Widget page) => Get.to(
        page,
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  static off(Widget page) => Get.off(
        page,
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  static offAll(Widget page) => Get.offAll(
        page,
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  static back() => Get.back();
}
