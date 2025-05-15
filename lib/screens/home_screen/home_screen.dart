import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/controller/home_controller.dart';
import 'package:pak_festive/screens/home_screen/widgets/deals_offers.dart';
import 'package:pak_festive/screens/home_screen/widgets/hi_tea_buffet.dart';
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
      appBar: CustomAppBar(
        height: 70.h,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commonController.getGreetingMessage(),
              style: AppTextStyles.font20_600TextStyle,
            ),
            verticalSpaceTiny,
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.locationIcon,
                    height: 20.h,
                    width: 20.w,
                  ),
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
        title: 'Home',
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Events',
                  style: AppTextStyles.font20_600TextStyle,
                ),
                TextButton(
                    onPressed: homeController.viewAllEvents,
                    child: Text(
                      'ViewAll',
                      style: AppTextStyles.font14_400TextStyle
                          .copyWith(color: kcPrimaryColor),
                    )),
              ],
            ),
            verticalSpaceTiny,
            LiveEvents(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deals & Offers',
                  style: AppTextStyles.font20_600TextStyle,
                ),
                TextButton(
                    onPressed: homeController.viewAllDealsAndOffers,
                    child: Text(
                      'ViewAll',
                      style: AppTextStyles.font14_400TextStyle
                          .copyWith(color: kcPrimaryColor),
                    )),
              ],
            ),
            DealsOffers(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi Tea & Buffet',
                  style: AppTextStyles.font20_600TextStyle,
                ),
                TextButton(
                    onPressed: homeController.viewAllBuffets,
                    child: Text(
                      'ViewAll',
                      style: AppTextStyles.font14_400TextStyle
                          .copyWith(color: kcPrimaryColor),
                    )),
              ],
            ),
            HiTeaBuffet(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Restaurants',
                  style: AppTextStyles.font20_600TextStyle,
                ),
                TextButton(
                    onPressed: homeController.viewAllRestaurants,
                    child: Text(
                      'ViewAll',
                      style: AppTextStyles.font14_400TextStyle
                          .copyWith(color: kcPrimaryColor),
                    ))
              ],
            ),
            verticalSpaceTiny,
            PapularRestaurants(),
          ],
        ),
      )),
    );
  }
}
