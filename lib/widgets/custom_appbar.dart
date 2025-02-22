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
  final bool leading;
  final bool? backNavigation;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.bgColor = kcPrimaryColor,
    this.actions,
    this.height = 56.0,
    this.bottom,
    this.backNavigation = false,
    this.leading = false,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backNavigation ?? false,
      toolbarHeight: height ?? 56.h,
      centerTitle: centerTitle,
      leading: leading
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, top: 8, left: 8),
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                decoration: BoxDecoration(
                    color: kcWhiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: kcBlackColor.withOpacity(0.2))
                    ]),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            )
          : null,
      title: titleWidget ??
          Text(
            title ?? '',
            style: AppTextStyles.font20_600TextStyle,
          ),
      backgroundColor: kcBackgroundColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: bottom ?? const SizedBox(),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56.h);
}
