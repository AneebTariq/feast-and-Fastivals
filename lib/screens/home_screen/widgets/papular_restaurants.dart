import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class PapularRestaurants extends StatelessWidget {
   PapularRestaurants({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              homeController.viewRestaurantDetail('');
            },
            child: Container(
              height: 180.h,
              margin: EdgeInsets.only(bottom: 15.h),
              decoration: BoxDecoration(
                color: kcPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZXZlbnR8ZW58MHx8MHx8fDA%3D'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: kcBlackColor.withOpacity(0.5)
                    )
                  ]
              ),
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
                        stops:const [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                                  ()=> GestureDetector(
                                onTap:(){
                                  homeController.toggleForFavorite();
                                },
                                child:  CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: homeController.isFavourite.value == true
                                      ? const Icon(Icons.favorite, color: kcErrorColor)
                                      : const Icon(Icons.favorite_border,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Restaurant Name',
                          style: AppTextStyles.font18_700TextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Rating: 4.5',
                              style: AppTextStyles.font13TextStyle,
                            ),
                            horizontalSpaceTiny,
                            const Icon(Icons.star,color: kcWarning,size: 20,),
                          ],
                        ),
                        verticalSpaceTiny,
                        Text(
                          'Open: 10 AM - 12 PM',
                          style: AppTextStyles.font11_500TextStyle,
                        ),
                        verticalSpaceTiny,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
