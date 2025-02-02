import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/helper.dart';
import '../../../widgets/common_textfield.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: authController.loginFormKey,
        child: Column(
          children: [
            CustomTextField(
              controller: authController.loginEmailController,
              hintText: 'Enter your email',
              prefix: const Icon(Icons.mail_outline, color: kcHintColor),
              bgClr: kcWhiteColor,
            ),
            verticalSpaceMedium,
            Obx(
              ()=> CustomTextField(
                controller: authController.loginPasswordController,
                hintText: 'Enter your password',
                prefix: const Icon(Icons.lock_outline, color: kcHintColor),
                bgClr: kcWhiteColor,
                obscureText: authController.isPasswordVisible.value,
                suffixIcon:
                GestureDetector(
                  onTap: authController.toggleForPasswordVisibility,
                  child: authController.isPasswordVisible.value==true
                      ?const Icon(Icons.visibility_off, color: kcHintColor)
                      :const Icon(Icons.visibility, color: kcHintColor),
                ),
              ),
            ),
          ],
        ));
  }
}
