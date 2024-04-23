import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class NoMatchedResultsWidget extends StatelessWidget {
  const NoMatchedResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 2.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: AppText(tr('no_matched_results')),
    );
  }
}
