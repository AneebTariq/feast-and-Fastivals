import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/helper.dart';
import '../../../widgets/common_textfield.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name Field
        CustomTextField(
          controller: authController.signupNameController,
          hintText: 'Enter your name',
          prefix: const Icon(Icons.person_outline, color: kcHintColor),
          bgClr: kcWhiteColor,
        ),
        verticalSpaceMedium,
        // Email Field
        CustomTextField(
          controller: authController.signupEmailController,
          hintText: 'Enter your email',
          prefix: const Icon(Icons.mail_outline, color: kcHintColor),
          bgClr: kcWhiteColor,
        ),
        verticalSpaceMedium,
        // Phone Number Field
        CustomTextField(
          controller: authController.signupPhoneController,
          hintText: 'Enter your phone number',
          prefix: const Icon(Icons.phone_outlined, color: kcHintColor),
          bgClr: kcWhiteColor,
        ),
        verticalSpaceMedium,
        // Password Field
        Obx(
          () => CustomTextField(
            controller: authController.signupPasswordController,
            hintText: 'Enter your password',
            prefix: const Icon(Icons.lock_outline, color: kcHintColor),
            bgClr: kcWhiteColor,
            obscureText: authController.isPasswordVisible.value,
            suffixIcon: GestureDetector(
              onTap: authController.toggleForPasswordVisibility,
              child: authController.isPasswordVisible.value==true
                  ?const Icon(Icons.visibility_off, color: kcHintColor)
                  :const Icon(Icons.visibility, color: kcHintColor),
            ),
          ),
        ),
      ],
    );
  }
}
