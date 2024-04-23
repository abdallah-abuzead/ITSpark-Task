import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/assets/app_images.dart';
import '../../../constants/messages/failure_messages.dart';
import '../../app_button.dart';

class ServerErrorWidget extends StatelessWidget {
  final Function() onPressed;
  final bool isStart;
  const ServerErrorWidget({Key? key, required this.onPressed, this.isStart = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          SizedBox(height: isStart ? 20 : 0),
          Lottie.asset(AppImages.lottieServerError, height: isStart ? 150 : 200),
          Text(
            FailureMessages.SERVER_FAILURE_MESSAGE.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.shade300),
          ),
          const SizedBox(height: 40),
          AppButton(
            title: 'try_again'.tr(),
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            radius: 6,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
