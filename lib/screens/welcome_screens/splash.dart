import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/widgets/safe_area_helper.dart';
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

    return SafeAreaHelper(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: kcBlackColor,
              child: Center(
                  child: Text(
                'Feast & Festivals',
                style: AppTextStyles.font24TextStyle
                    .copyWith(color: kcWhiteColor),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
