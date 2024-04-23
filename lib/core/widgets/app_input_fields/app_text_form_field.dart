import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itspark/core/widgets/app_input_fields/phone_prefix_icon.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_locale.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction action;
  final String hint;
  final Widget? prefixIcon;
  final bool isPassword;
  final bool readOnly;
  final bool autoFocus;
  final Color fillColor;
  final String? keyError;
  final Map<String, dynamic>? errors;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;

  const AppTextFormField({
    Key? key,
    required this.controller,
    this.keyboardType,
    required this.hint,
    this.prefixIcon,
    this.action = TextInputAction.next,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.fillColor = Colors.white,
    this.validator,
    this.onChanged,
    this.onTap,
    this.keyError,
    this.inputFormatters,
    this.errors,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // enableInteractiveSelection: false,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: action,
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.text,
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: autoFocus ? 16 : 14,
        fontWeight: FontWeight.w500,
        color: readOnly ? AppColors.text.shade400 : AppColors.text,
      ),
      readOnly: readOnly,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        filled: true,
        fillColor: fillColor,
        hintStyle: TextStyle(color: AppColors.text.shade200, fontSize: 14, fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: AppLocale.isEnglish ? 15 : 10),
        prefixIcon: keyboardType == TextInputType.phone ? const PhonePrefixIcon() : prefixIcon,
        suffixIcon: suffixIcon,
        errorText: _getErrorText(keyError),
        errorStyle: const TextStyle(color: AppColors.error, fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }

  String? _getErrorText(String? key) {
    if (errors != null) {
      return errors!.keys.contains(key) ? errors![key][0] : null;
    } else {
      return null;
    }
  }
}
