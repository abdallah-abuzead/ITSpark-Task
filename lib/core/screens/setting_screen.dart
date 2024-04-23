import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:itspark/core/widgets/custom_app_bar.dart';

import '../constants/app_locale.dart';
import '../widgets/setting_screen/setting_header_item.dart';
import '../widgets/setting_screen/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(title: 'settings'.tr()),
            Expanded(
              child: ListView(
                children: [
                  SettingHeaderWidget(title: 'main_settings'.tr()),
                  const SizedBox(height: 14),
                  SettingItem(
                    title: 'language'.tr(),
                    icon: Icons.language,
                    onTap: () => AppLocale.toggleLocale(),
                    isLang: true,
                  ),
                  SettingItem(title: 'profile'.tr(), icon: Icons.person),
                  SettingItem(title: 'notifications'.tr(), icon: Icons.notifications),
                  SettingItem(title: 'security'.tr(), icon: Icons.security),
                  const SizedBox(height: 14),
                  SettingHeaderWidget(title: 'reach_out_to_us'.tr()),
                  const SizedBox(height: 14),
                  SettingItem(title: 'about'.tr(), icon: Icons.info),
                  SettingItem(title: 'share'.tr(), icon: Icons.share),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
