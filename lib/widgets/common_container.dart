import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key,this.bgClr=kcWhiteColor,required this.child});
final Widget child;
final Color  bgClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      decoration: BoxDecoration(
          color: bgClr,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
              color: kcBlackColor.withOpacity(0.2),
            )
          ]
      ),
      child: child,
    );
  }
}
