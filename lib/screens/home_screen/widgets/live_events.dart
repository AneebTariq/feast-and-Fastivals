import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../../controller/home_controller.dart';

class LiveEvents extends StatelessWidget {
   LiveEvents({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 400.w,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.events.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:(){
                homeController.viewEventDetail('');
              },
              child: Container(
                width: 180.w,
                margin: EdgeInsets.only(right: 15.w, bottom: 5.h),
                decoration: BoxDecoration(
                    color: kcPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(
                      image: NetworkImage(
                          '${homeController.events[index]}'),
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
                            kcWhiteColor.withOpacity(0.9),
                            kcWhiteColor.withOpacity(0.5),
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            'The new event',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.font16_600TextStyle,
                          ),
                          verticalSpaceTiny,
                          Text(
                            'Created by: Aneeb Tariq',
                            style: AppTextStyles.font12_400TextStyle,
                          ),
                          verticalSpaceTiny,
                          Text(
                            'Available Tickets: 10',
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
    );
  }
}
