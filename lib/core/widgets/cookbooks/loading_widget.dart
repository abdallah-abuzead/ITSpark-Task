import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'loading'.tr(),
            style: TextStyle(color: AppColors.text.shade200, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          SizedBox(
            width: 30,
            child: DefaultTextStyle(
              style: TextStyle(color: AppColors.text.shade100, fontWeight: FontWeight.w500, fontSize: 18),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [TyperAnimatedText('...', speed: const Duration(milliseconds: 150))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
