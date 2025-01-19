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
                    'Login',
                    style: AppTextStyles.font24_900TextStyle.copyWith(color: kcWhiteColor),
                  ),
                  verticalSpaceLarge,
                  Text(
                    'Welcome back to Feast & festivals',
                    style: AppTextStyles.font18_700TextStyle
                        .copyWith(color: kcWhiteColor),
                  ),
                  verticalSpaceLarge,
                  LoginForm(),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: authController.forgetPassword,
                        child: Text(
                          'Forget password?',
                          style: AppTextStyles.font14_400TextStyle.copyWith(
                            color: kcWhiteColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                  CustomButton(
                    btnText: 'Login',
                    onClick: authController.login,
                  ),
                  verticalSpaceMedium,
                  Text(
                    'or',
                    style: AppTextStyles.font24_900TextStyle
                        .copyWith(color: kcWhiteColor),
                  ),
                  verticalSpaceMedium,
                  CustomButton(
                    onClick: authController.loginWithGoogle,
                    btnIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Image.asset(
                        ImageAssets.google,
                        height: 40.h,
                        width: 40.h,
                      ),
                    ),
                    btnText: 'Login with Google',
                    bgColor: kcWhiteColor,
                    outLineBorder: true,
                  ),
                  verticalSpaceMedium,
                  CustomButton(
                    onClick: authController.loginWithApple,
                    btnIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Image.asset(
                        ImageAssets.apple,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    btnText: 'Login with Apple',
                    bgColor: kcWhiteColor,
                    outLineBorder: true,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have Account? ',
                        style: AppTextStyles.font14_600TextStyle.copyWith(
                          color: kcVeryLightGrey,
                        ),
                      ),
                      GestureDetector(
                          onTap: authController.signUpNavigation,
                          child: Text(
                            'Sign Up',
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
