import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class SettingListWidget extends StatelessWidget {
  const SettingListWidget( {
    super.key,
    required this.title,
    this.subTitle,
    this.icon,
    this.iconWidget,
    this.onClick,
    required this.firstIcon,
    required this.firstIconClr,
  });
  final String title;
  final String? subTitle;
  final IconData? icon;
  final IconData firstIcon;
  final Color firstIconClr;
  final Widget? iconWidget;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 15.h, horizontal:10.w),
        decoration: BoxDecoration(
          color: kcBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kcLightGrey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: firstIconClr,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  firstIcon,
                  color: firstIconClr == kcBackgroundColor
                      ? kcPrimaryColor
                      : kcBackgroundColor,
                  size: 18,
                )),
            horizontalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.font16_400TextStyle,
                ),
                subTitle == null
                    ? const SizedBox.shrink()
                    : Text(
                  "$subTitle",
                  style: AppTextStyles.font12_400TextStyle
                      .copyWith(color: kcMediumGrey),
                ),
              ],
            ),
            const Spacer(),
            iconWidget == null
                ? Icon(
              icon,
              color: kcLightGrey,
              size: 18,
            )
                : iconWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
