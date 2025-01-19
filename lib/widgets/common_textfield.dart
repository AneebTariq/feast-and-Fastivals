import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/utils/app_colors.dart';

import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool obscureText;
  final String? title;
  final String? borderTitle;
  final InputBorder? border;
  final int maxLines;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final Color? bgClr;
  final double? radius;

  const CustomTextField({
    super.key,
    this.title,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.bgClr,
    this.textStyle,
    this.prefix,
    this.border,
    this.borderTitle,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false, // Default to editable
    this.autoFocus = false, // Default to no autofocus
    this.validator,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??10),
        color:bgClr?? kcWhiteColor,
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        readOnly: isReadOnly, // Use the read-only flag
        autofocus: autoFocus, // Use the auto-focus flag
        validator: validator, // Use the validator if provided
        style: textStyle ??
            AppTextStyles.font14_600TextStyle.copyWith(color: kcBlackColor),
        decoration: InputDecoration(
          prefixIcon: prefix,
          hintText: title ?? '',
          labelText: borderTitle,
          hintStyle:
          AppTextStyles.font14_400TextStyle.copyWith(color: kcHintColor),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          border: border ??
              OutlineInputBorder(
                  borderSide:  BorderSide(color:bgClr??kcHintColor ),
                  borderRadius: BorderRadius.circular(radius??10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kcPrimaryColor),
              borderRadius: BorderRadius.circular(radius??10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kcErrorColor),
              borderRadius: BorderRadius.circular(radius??10)),
          alignLabelWithHint: true,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
