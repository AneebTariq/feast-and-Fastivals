import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/app_colors.dart';

class ProfilePicSignup extends StatelessWidget {
   ProfilePicSignup({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.h,
        width: 120.w,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kcWhiteColor,
          border: Border.all(color: kcLightGrey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          children: [
           Obx(()=>
           authController.profilePicUrl.isEmpty?const SizedBox()
               :ClipRRect(
             borderRadius: BorderRadius.circular(100),
             child: Image.asset(authController.profilePicUrl.value,fit: BoxFit.cover,),
           ),),
            Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: kcWhiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: GestureDetector(
                onTap: authController.pickImage,
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: kcSecondary,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
