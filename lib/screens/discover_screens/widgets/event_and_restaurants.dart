import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class EventAndRestaurants extends StatelessWidget {
  const EventAndRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 0, // Spacing between rows
        crossAxisSpacing: 0, // Spacing between columns
        children: List.generate(
        20,
        (index) => Container(
          height: 250.h,
          width: 200.w,
          margin: EdgeInsets.only(right: 15.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: kcPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3Vwd2s2MTY5MTk3NS13aWtpbWVkaWEtaW1hZ2Uta293YjI4OTguanBn.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: kcBlackColor.withOpacity(0.1))
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: const Icon(
                    //           Icons.favorite_outline,
                    //           size: 25,
                    //           color: kcSecondary,
                    //         )),
                    //   ],
                    // ),
                    const Spacer(),
                    Text(
                      'The new event',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.font18_700TextStyle,
                    ),
                    Text(
                      'Created by: Aneeb Tariq',
                      style: AppTextStyles.font13TextStyle,
                    ),
                    verticalSpaceTiny,
                    Text(
                      'Available Tickets: 10',
                      style: AppTextStyles.font11_500TextStyle,
                    ),
                    verticalSpaceTiny,
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
