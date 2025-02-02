import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/widgets/safe_area_helper.dart';
import '../../utils/image_assets.dart';
import '../auth_screens/login.dart';

class SplashScreen extends StatelessWidget {
  final CommonController controller = Get.find<CommonController>();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Get Settings Data First If required
      //controller.isLogin().then((value) async {
      // if (value) {
      // Get Logged In User Data
      Get.offAll(() => LoginScreen());
      // Get.offAll(() => BottomBarDesign());
      //  } else {
      // Get.offAll(() => LoginScreen());
      //  }
      // });
    });

    return Scaffold(
      backgroundColor:kcBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(ImageAssets.logo,height:200.h,width: 200.w,fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}
