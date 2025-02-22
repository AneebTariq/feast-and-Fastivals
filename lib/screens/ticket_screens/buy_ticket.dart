import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';
import 'package:pak_festive/widgets/custom_button.dart';

import '../../controller/event_controller.dart';
import '../../widgets/common_textfield.dart';

class BuyTicket extends StatelessWidget {
   BuyTicket({super.key});
  final eventController=Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Booking Details',
        centerTitle: true,
        leading: true,
        backNavigation: false,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              CustomTextField(
                controller: eventController.nameController,
                hintText: 'Enter your Name',
                prefix: const Icon(Icons.person_outlined, color: kcSecondary),
                bgClr: kcWhiteColor,
                borderSide:BorderSide.none,
              ),
              verticalSpaceSmall,
              CustomTextField(
                controller: eventController.emailController,
                hintText: 'Enter your email',
                prefix: const Icon(Icons.email_outlined, color: kcSecondary),
                bgClr: kcWhiteColor,
                borderSide:BorderSide.none,
              ),
              verticalSpaceSmall,
              CustomTextField(
                controller: eventController.numberController,
                hintText: 'Enter your Number',
                prefix: const Icon(Icons.phone_in_talk_outlined, color: kcSecondary),
                bgClr: kcWhiteColor,
                borderSide:BorderSide.none,
              ),
              verticalSpaceMassive,
              CustomButton(
                  onClick: (){},
                  btnText: 'Book Now'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
