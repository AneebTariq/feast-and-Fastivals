import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:super_banners/super_banners.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class DealsOffers extends StatelessWidget {
   DealsOffers({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      width: 400.w,
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.offers.length,
          itemBuilder: (context,index){
        return  GestureDetector(
          onTap: () {
            _showFullScreenImage(
                context, homeController.offers[index]);
          },
          child: Container(
            width: 300.w,
            margin: EdgeInsets.only(right: 15.h,bottom: 5.h,top: 5.h),
            decoration: BoxDecoration(
                color: kcWhiteColor,
                borderRadius: BorderRadius.circular(15),
                image:  DecorationImage(
                  image: NetworkImage(
                      '${homeController.offers[index]}'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: kcBlackColor.withOpacity(0.2)
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
                        kcWhiteColor.withOpacity(0.9),
                        kcWhiteColor.withOpacity(0.9),
                        kcTransparent,
                      ],
                      stops:const [
                        0.1,
                        0.3,
                        0.1,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                 CornerBanner(
                  bannerPosition: CornerBannerPosition.topLeft,
                  bannerColor: kcErrorColor,
                  child: Text("20% Off",style: AppTextStyles.font12_400TextStyle.copyWith(color: kcWhiteColor),),
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
                              child: Container(
                                height: 40.h,
                                width: 35.w,
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kcWhiteColor,
                                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Rating: 4.5',
                            style: AppTextStyles.font12_400TextStyle,
                          ),
                          horizontalSpaceTiny,
                          const Icon(Icons.star,color: kcWarning,size: 20,),
                          const Spacer(),
                          Text(
                            '10',
                            style: AppTextStyles.font14_600TextStyle,
                          ),
                          horizontalSpaceTiny,
                          const Icon(Icons.favorite_outline,size: 20,color: kcErrorColor,),
                          horizontalSpaceSmall,
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              color: kcBlackColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            '10',
                            style: AppTextStyles.font14_600TextStyle,
                          ),
                          horizontalSpaceTiny,
                          const Icon(FontAwesomeIcons.message,size: 20,color: kcPrimaryColor,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
   void _showFullScreenImage(BuildContext context, String imageUrl) {
     showDialog(
       context: context,
       builder: (context) {
         return Dialog(
           backgroundColor: Colors.black,
           insetPadding: const EdgeInsets.all(10),
           child: GestureDetector(
             onTap: () {
               Navigator.pop(context);
             },
             child: InteractiveViewer(
               panEnabled: true,
               minScale: 0.5,
               maxScale: 3.0,
               child: Center(
                 child: Image.network(
                   imageUrl,
                   fit: BoxFit.contain,
                 ),
               ),
             ),
           ),
         );
       },
     );
   }
}
