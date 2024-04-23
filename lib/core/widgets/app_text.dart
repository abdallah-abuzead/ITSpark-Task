import 'package:flutter/material.dart';

import '../constants/app_locale.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final TextDecoration? decoration;
  final double? letterSpacing;

  const AppText(
    this.text, {
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.overflow,
    this.maxLines,
    this.height,
    this.decoration,
    this.letterSpacing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? (AppLocale.isEnglish ? 13 : 13),
        fontFamily: fontFamily ?? (AppLocale.isEnglish ? AppFontFamilies.inter : AppFontFamilies.cairo),
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        height: height,
        decoration: decoration,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class AppFontFamilies {
  static const String inter = 'Inter';
  static const String cairo = 'Cairo';
}
