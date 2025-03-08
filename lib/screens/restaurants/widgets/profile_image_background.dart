import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../../utils/app_colors.dart';

class ProfileImageBackground extends StatelessWidget {
  const ProfileImageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 330.h,
          width: double.infinity,
          decoration: BoxDecoration(color: kcPrimaryColor, boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: kcBlackColor.withOpacity(0.2))
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1511795409834-ef04bbd61622?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZXZlbnR8ZW58MHx8MHx8fDA%3D',
                fit: BoxFit.cover,
                height: 200.h,
                width: double.infinity,
              ),
              Container(
                height: 130.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kcWhiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceTiny,
                    Padding(
                      padding: EdgeInsets.only(left: 105.w, right: 15.w),
                      child: Text(
                        'Restaurant Name',
                        style: AppTextStyles.font16_600TextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    verticalSpaceTiny,
                    Padding(
                      padding: EdgeInsets.only(left: 105.w, right: 15.w),
                      child: Text(
                        'Kohanoor, block 1, faisalabad',
                        style: AppTextStyles.font12_400TextStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    verticalSpaceSmall,
                    verticalSpaceTiny,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          Text(
                            'Rating: 4.5',
                            style: AppTextStyles.font14_400TextStyle,
                          ),
                          horizontalSpaceTiny,
                          const Icon(
                            Icons.star,
                            color: kcWarning,
                            size: 20,
                          ),
                          horizontalSpaceSmall,
                          Container(
                            height: 5.h,
                            width: 5.w,
                            decoration: const BoxDecoration(
                                color: kcBlackColor, shape: BoxShape.circle),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            'Open: 10 AM - 12 PM',
                            style: AppTextStyles.font14_400TextStyle,
                          ),
                          verticalSpaceTiny,
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        children: [
                          Text(
                            'Followers: 100k+',
                            style: AppTextStyles.font14_400TextStyle,
                          ),
                          horizontalSpaceTiny,
                          const Icon(
                            Icons.people,
                            color: kcWarning,
                            size: 20,
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: kcPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Follow',
                              style: AppTextStyles.font16_600TextStyle
                                  .copyWith(color: kcWhiteColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 80.h,
          left: 15.w,
          child: Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              color: kcWhiteColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: kcBlackColor.withOpacity(0.2),
                )
              ],
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.creativefabrica.com/wp-content/uploads/2023/04/24/restaurant-logo-design-Graphics-67998518-2-580x405.jpg',
                  ),
                  fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 15.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: kcBlackColor.withOpacity(0.2))
                  ]),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: kcPrimaryColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 15.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: kcWhiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: kcBlackColor.withOpacity(0.2))
                  ]),
              child: const Center(
                child: Icon(
                  Icons.more_vert,
                  size: 20,
                  color: kcPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
