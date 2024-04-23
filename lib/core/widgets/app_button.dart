import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_locale.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool wrapWithContainer;
  final Function()? onPressed;
  final Widget? icon;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? side;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  const AppButton({
    required this.title,
    required this.onPressed,
    this.wrapWithContainer = false,
    this.icon,
    this.radius = 4,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.foregroundColor,
    this.side,
    this.width,
    this.fontSize,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: wrapWithContainer ? const EdgeInsets.symmetric(horizontal: 16, vertical: 18) : null,
      margin: margin,
      height: wrapWithContainer ? 80 : null,
      width: width,
      decoration: wrapWithContainer
          ? const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.borderShade75)),
            )
          : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: wrapWithContainer
              ? EdgeInsets.zero
              : padding ?? EdgeInsets.symmetric(vertical: AppLocale.isEnglish ? 8 : 5),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.4),
          disabledForegroundColor: Colors.white,
          side: side,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? Container(),
            SizedBox(width: icon == null ? 0 : 8),
            Text(title, style: TextStyle(fontWeight: fontWeight ?? FontWeight.w600, fontSize: fontSize ?? 14)),
          ],
        ),
      ),
    );
  }
}
