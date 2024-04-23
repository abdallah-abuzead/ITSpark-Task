import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_locale.dart';
import '../../utils/validation/validator.dart';
import 'app_text_form_field.dart';

class AppFormFields {
  static AppTextFormField dateOfBirthTextField(BuildContext context, TextEditingController controller) {
    return AppTextFormField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      hint: '12/2/2023',
      readOnly: true,
      validator: (_) => Validator.dateOfBirthValidator(controller.text),
      onTap: () => showDatePicker(
        locale: AppLocale.english,
        context: context,
        initialDate: DateTime(DateTime.now().year - 5),
        firstDate: DateTime(1960),
        lastDate: DateTime(DateTime.now().year - 2),
        cancelText: 'cancel'.tr(),
        confirmText: 'pick'.tr(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary, // header background color
                onPrimary: Colors.white, // header text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
              ),
            ),
            child: child!,
          );
        },
      ).then((value) {
        if (value != null) controller.text = DateFormat('dd/MM/yyyy').format(value);
      }),
    );
  }
}
