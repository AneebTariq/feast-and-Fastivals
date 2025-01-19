import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? bgColor;
  final List<Widget>? actions;
  final double? height;
  final Widget? bottom;
  final bool? backNavigation;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.bgColor = kcPrimaryColor,
    this.actions,
    this.height = 70.0,
    this.bottom,
    this.backNavigation = false,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kcPrimaryColor,
            kcPrimaryColor.withOpacity(0.8),
            kcPrimaryColor.withOpacity(0.5)
          ],
          stops: const [0.1, 0.6, 1.0],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          // bottomRight: Radius.circular(20.0),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: backNavigation ?? false,
        toolbarHeight: height ?? 70.h,
        centerTitle: centerTitle,
        foregroundColor: kcWhiteColor,
        title: titleWidget ??
            Text(
              title ?? '',
              style: AppTextStyles.font24_600TextStyle,
            ),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.h),
          child: bottom ?? const SizedBox(),
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 70.h);
}
