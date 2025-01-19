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
              controller: authController.loginNumberController,
              title: 'number',
              bgClr: kcWhiteColor,
            ),
            verticalSpaceMedium,
            CustomTextField(
              controller: authController.loginPasswordController,
              title: 'Password',
              bgClr: kcWhiteColor,
            ),
          ],
        ));
  }
}
