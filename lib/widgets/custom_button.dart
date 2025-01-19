import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onClick,
    required this.btnText,
    this.bgColor = kcPrimaryColor,
    this.borderRadius = 49,
    this.margin,
    this.outLineBorder = false,
    this.height,
    this.width,
    this.textColor,
    this.btnIcon,
    this.btnStyle,
  });

  final VoidCallback onClick; // Updated to use VoidCallback for simplicity
  final Color? bgColor;
  final String btnText;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final bool? outLineBorder;
  final double? height;
  final double? width;
  final Color? textColor;
  final Widget? btnIcon;
  final TextStyle? btnStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick, // Handle button click
      child: Container(
        height: height ?? 50.h,
        width: width ?? double.infinity,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: outLineBorder == true
                ? kcVeryLightGrey.withOpacity(0.2)
                : bgColor,
            border: outLineBorder == true
                ? Border.all(color: bgColor ?? kcVeryLightGrey)
                : null, // Add border if outLineBorder is true
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
                color: kcBlackColor.withOpacity(0.1),
              )
            ]),
        child: Row(
          children: [
            btnIcon ?? const SizedBox.shrink(),
            const Spacer(),
            Text(
              btnText,
              style: btnStyle ??
                  AppTextStyles.font24_900TextStyle.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: 20 // Added textColor support
                  ),
            ),
            const Spacer(),
            btnIcon != null
                ? const SizedBox(
              width: 20,
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
