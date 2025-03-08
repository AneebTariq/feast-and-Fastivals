import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';

import '../../controller/home_controller.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/helper.dart';

class AllRestaurants extends StatelessWidget {
  AllRestaurants({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'All Restaurants',
        centerTitle: true,
        backNavigation: false,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeController.restaurants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        homeController.viewRestaurantDetail('');
                      },
                      child: Container(
                        height: 180.h,
                        margin: EdgeInsets.only(bottom: 15.h),
                        decoration: BoxDecoration(
                            color: kcPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${homeController.restaurants[index]}'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: kcBlackColor.withOpacity(0.2))
                            ]),
                        child: Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: [
                                    kcWhiteColor.withOpacity(0.8),
                                    kcWhiteColor.withOpacity(0.4),
                                    kcTransparent,
                                  ],
                                  stops: const [
                                    0.2,
                                    0.5,
                                    0.2,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Restaurant Name',
                                    style: AppTextStyles.font16_600TextStyle,
                                  ),
                                  verticalSpaceTiny,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rating: 4.5',
                                        style:
                                            AppTextStyles.font12_400TextStyle,
                                      ),
                                      horizontalSpaceTiny,
                                      const Icon(
                                        Icons.star,
                                        color: kcWarning,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    'Open: 10 AM - 12 PM',
                                    style: AppTextStyles.font12_400TextStyle,
                                  ),
                                  verticalSpaceTiny,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
