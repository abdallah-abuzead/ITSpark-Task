import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/validation/validator.dart';
import '../../../../../core/widgets/app_text.dart';

class StudentClassDropDownMenu extends StatelessWidget {
  StudentClassDropDownMenu({super.key, required this.classController});

  final TextEditingController classController;

  final List<String> classes = ['class_a', 'class_b', 'class_c'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      value: classController.text.isEmpty ? null : classController.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      selectedItemHighlightColor: AppColors.text.shade100.withOpacity(0.5),
      itemHeight: 40,
      isDense: true,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: 'class_hint'.tr(),
        hintStyle: TextStyle(color: AppColors.text.shade300, fontSize: 13),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      ),
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.text),
      iconSize: 30,
      buttonHeight: 50,
      buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
      dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      items: classes.map<DropdownMenuItem<String>>((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: AppText(type.tr(), fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.text),
        );
      }).toList(),
      itemHighlightColor: AppColors.text.shade300,
      itemSplashColor: AppColors.text.shade300,
      onChanged: (newValue) => classController.text = newValue!,
      validator: (_) => Validator.studyClassValidator(classController.text),
      onSaved: (value) => classController.text = value as String,
    );
  }
}
