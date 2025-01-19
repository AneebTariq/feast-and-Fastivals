import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/common_controller.dart';
import 'package:pak_festive/screens/home_screen/widgets/live_events.dart';
import 'package:pak_festive/screens/home_screen/widgets/papular_restaurants.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
        titleWidget:Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commonController.getGreetingMessage(),
                  style: AppTextStyles.font24_900TextStyle,
                ),
                Padding(
                  padding: EdgeInsets.only(left:20.w),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_sharp,size: 20,color: kcWhiteColor,),
                      horizontalSpaceTiny,
                      Text(
                        'Faisalabad',
                        style: AppTextStyles.font15_600TextStyle.copyWith(
                          color: kcWhiteColor,
                        ),
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
              Text('Events',style: AppTextStyles.font24_900TextStyle,),
              const LiveEvents(),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Restaurants',style: AppTextStyles.font24_900TextStyle,),
                  TextButton(onPressed: (){}, child: Text('ViewAll',style: AppTextStyles.font15_600TextStyle.copyWith(color: kcBlueColor),))
                ],
              ),
              verticalSpaceSmall,
              const PapularRestaurants(),
              Container(),
            ],
          ),
        )
      ),
    );
  }
}
