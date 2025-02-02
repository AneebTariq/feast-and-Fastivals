import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pak_festive/screens/auth_screens/login.dart';
import 'package:pak_festive/screens/home_screen/home_screen.dart';

import '../screens/auth_screens/sign_up_screen.dart';
import '../screens/bottom_bar/bottom_bar_screen.dart';

class AuthController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  RxBool checkBoxClr = false.obs;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupConfirmPasswordController = TextEditingController();
  final loginFormKey=GlobalKey<FormState>();
  final signUpFormKey=GlobalKey<FormState>();
RxString profilePicUrl=''.obs;

  pickImage(){

  }

  void toggleForcheckbox() {
    checkBoxClr.value = !checkBoxClr.value;
  }

  void toggleForPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // Corrected line
  }

  login(){
    Get.to(()=>BottomBarScreen());
  }

  loginWithGoogle(){
    Get.to(()=>BottomBarScreen());
  }

  loginWithApple(){
    Get.to(()=>BottomBarScreen());
  }

  forgetPassword(){
    Get.to(()=>BottomBarScreen());
  }

  signup(){
    Get.to(()=>BottomBarScreen());
  }

  signUpNavigation(){
    Get.offAll(()=>SignUpScreen());
  }

  loginNavigation(){
    Get.offAll(()=>LoginScreen());
  }

}
