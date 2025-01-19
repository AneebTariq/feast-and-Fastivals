import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/auth_controller.dart';
import 'package:pak_festive/controller/common_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/helper.dart';
import '../../utils/image_assets.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final CommonController controller = Get.find<CommonController>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.bgImage), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kcBlackColor,
                  kcBlackColor.withOpacity(0.2),
                  kcBlackColor.withOpacity(0.2)
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(children: [
                  verticalSpaceMassive,
                  Text(
                    'Sign Up',
                    style: AppTextStyles.font24_900TextStyle,
                  ),
                  verticalSpaceMassive,
                  CustomTextField(
                    controller: authController.loginNumberController,
                    title: 'Name',
                    bgClr: kcWhiteColor,
                    suffixIcon: const Icon(Icons.person_3_outlined,color: kcHintColor,),
                  ),
                  verticalSpaceMedium,
                  CustomTextField(
                    controller: authController.loginNumberController,
                    title: 'Email',
                    bgClr: kcWhiteColor,
                    suffixIcon: const Icon(Icons.mail_outline_rounded,color: kcHintColor,),
                  ),
                  verticalSpaceMedium,
                  CustomTextField(
                    controller: authController.loginNumberController,
                    title: 'number',
                    bgClr: kcWhiteColor,
                    suffixIcon: const Icon(Icons.phone_in_talk_outlined,color: kcHintColor,),
                  ),
                  verticalSpaceMedium,
                  CustomTextField(
                    controller: authController.loginPasswordController,
                    title: 'Password',
                    bgClr: kcWhiteColor,
                    obscureText: true,
                    suffixIcon: const Icon(Icons.visibility_off,color: kcHintColor,),
                  ),
                  verticalSpaceLarge,
                  CustomButton(
                    btnText: 'Sign Up',
                    onClick: authController.signup,
                  ),
                  verticalSpaceMassive,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have Account? ',
                        style: AppTextStyles.font14_600TextStyle.copyWith(
                          color: kcVeryLightGrey,
                        ),
                      ),
                      GestureDetector(
                          onTap: authController.loginNavigation,
                          child: Text(
                            'Login',
                            style: AppTextStyles.font14_600TextStyle.copyWith(
                              color: kcBlueColor,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
