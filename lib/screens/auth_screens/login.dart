import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/auth_controller.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/screens/auth_screens/widgets/login_form.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/utils/image_assets.dart';
import 'package:pak_festive/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final CommonController controller = Get.find<CommonController>();
  final authController = Get.put(AuthController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcPrimaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kcPrimaryColorDark.withOpacity(0.9),
              kcPrimaryColor.withOpacity(0.6),
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
                // App Logo or Icon (Optional)
                Image.asset(
                  ImageAssets.logo, // Replace with your app logo asset
                  height: 150.h,
                  width: 150.w,
                ),
                verticalSpaceSmall,
                Text(
                  'Login',
                  style: AppTextStyles.font24_900TextStyle.copyWith(
                    color: kcWhiteColor,
                    fontSize: 32.sp,
                  ),
                ),
                verticalSpaceSmall,
                Text(
                  'Welcome back to Feast & Festivals',
                  style: AppTextStyles.font18_700TextStyle.copyWith(
                    color: kcWhiteColor.withOpacity(0.8),
                    fontSize: 16.sp,
                  ),
                ),
                verticalSpaceMedium,
                verticalSpaceSmall,
                // Login Form
                LoginForm(),
                verticalSpaceMedium,
                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: authController.forgetPassword,
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.font14_400TextStyle.copyWith(
                        color: kcWhiteColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                verticalSpaceSmall,
                // Login Button
                CustomButton(
                  btnText: 'Login',
                  onClick: authController.login,
                  bgColor: kcSecondary,
                  textColor: kcWhiteColor,
                ),
                verticalSpaceMedium,
                // Divider with "OR"
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: kcWhiteColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or',
                        style: AppTextStyles.font14_600TextStyle.copyWith(
                          color: kcWhiteColor.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: kcWhiteColor.withOpacity(0.3),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                // Google Login Button
                CustomButton(
                  onClick: authController.loginWithGoogle,
                  btnIcon: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Image.asset(
                      ImageAssets.google,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  btnText: 'Login with Google',
                  bgColor: kcWhiteColor,
                  textColor: kcWhiteColor,
                  outLineBorder: true,
                ),
                verticalSpaceSmall,
                // Apple Login Button
                CustomButton(
                  onClick: authController.loginWithApple,
                  btnIcon: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Image.asset(
                      ImageAssets.apple,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  btnText: 'Login with Apple',
                  bgColor: kcWhiteColor,
                  textColor: kcWhiteColor,
                  outLineBorder: true,
                ),
                verticalSpaceMedium,
                // Sign Up Prompt
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: AppTextStyles.font14_600TextStyle.copyWith(
                        color: kcWhiteColor.withOpacity(0.8),
                      ),
                    ),
                    GestureDetector(
                      onTap: authController.signUpNavigation,
                      child: Text(
                        'Sign Up',
                        style: AppTextStyles.font14_600TextStyle.copyWith(
                          color: kcSecondary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpaceMassive,
              ],
            ),
          ),
        ),
      ),
    );
  }
}