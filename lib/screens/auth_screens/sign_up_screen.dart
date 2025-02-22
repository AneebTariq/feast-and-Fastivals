import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/auth_controller.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/screens/auth_screens/widgets/profile_pic_signUp.dart';
import 'package:pak_festive/screens/auth_screens/widgets/signUp_form.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/utils/image_assets.dart';
import 'package:pak_festive/widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final CommonController controller = Get.find<CommonController>();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kcPrimaryColorDark.withOpacity(0.9),
                kcPrimaryColor.withOpacity(0.7),
                kcPrimaryColorLight.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  verticalSpaceLarge,
                  Text(
                    'Create Account',
                    style: AppTextStyles.font16_600TextStyle.copyWith(
                      color: kcWhiteColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    'Join us to explore events and restaurants!',
                    style: AppTextStyles.font16_400TextStyle.copyWith(
                      color: kcWhiteColor.withOpacity(0.8),
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpaceLarge,
                  // Profile Picture Upload
                  ProfilePicSignup(),
                  verticalSpaceLarge,
                  SignUpForm(),
                  verticalSpaceLarge,
                  // Sign Up Button
                  CustomButton(
                    btnText: 'Sign Up',
                    onClick: authController.signup,
                    bgColor: kcSecondary,
                    textColor: kcWhiteColor,
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  // Login Prompt
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppTextStyles.font14_400TextStyle.copyWith(
                          color: kcWhiteColor.withOpacity(0.8),
                        ),
                      ),
                      GestureDetector(
                        onTap: authController.loginNavigation,
                        child: Text(
                          'Login',
                          style: AppTextStyles.font14_600TextStyle.copyWith(
                            color: kcSecondary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}