import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:itspark/core/constants/app_colors.dart';
import 'package:itspark/core/screens/setting_screen.dart';
import 'package:itspark/core/screens/web_view_screen.dart';
import 'package:itspark/modules/students/presentation/screens/students_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.school), label: 'students'.tr()),
            BottomNavigationBarItem(icon: const Icon(Icons.search), label: 'search'.tr()),
            BottomNavigationBarItem(icon: const Icon(Icons.settings), label: 'settings'.tr()),
          ],
          onTap: (index) => setState(() => selectedIndex = index),
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedItemColor: AppColors.text.shade400,
        ),
        body: _getSelectedScreen(),
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (selectedIndex) {
      case 0:
        return const StudentsScreen();
      case 1:
        return WebViewScreen(title: 'google_search'.tr());
      default:
        return const SettingScreen();
    }
  }
}
