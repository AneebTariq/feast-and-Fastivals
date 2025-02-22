import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/controller/home_controller.dart';
import 'package:pak_festive/screens/home_screen/widgets/live_events.dart';
import 'package:pak_festive/screens/home_screen/widgets/papular_restaurants.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/utils/image_assets.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final commonController = Get.put(CommonController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar:CustomAppBar(
        titleWidget:Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commonController.getGreetingMessage(),
                  style: AppTextStyles.font20_600TextStyle,
                ),
                verticalSpaceTiny,
                Padding(
                  padding: EdgeInsets.only(left:20.w),
                  child: Row(
                    children: [
                      Image.asset(ImageAssets.locationIcon,height: 20.h,width: 20.w,),
                      horizontalSpaceTiny,
                      Text(
                        'Faisalabad',
                        style: AppTextStyles.font14_400TextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ) ,
         title: 'Home',
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Events',style: AppTextStyles.font20_600TextStyle,),
                  TextButton(onPressed: homeController.viewAllEvents, child: Text('ViewAll',style: AppTextStyles.font14_400TextStyle.copyWith(color: kcSecondary),)),
                ],
              ),
              verticalSpaceSmall,
              LiveEvents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Restaurants',style: AppTextStyles.font20_600TextStyle,),
                  TextButton(onPressed: homeController.viewAllRestaurants, child: Text('ViewAll',style: AppTextStyles.font14_400TextStyle.copyWith(color: kcSecondary),))
                ],
              ),
              verticalSpaceSmall,
              PapularRestaurants(),
            ],
          ),
        )
      ),
    );
  }
}
