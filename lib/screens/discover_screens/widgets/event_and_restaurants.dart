import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/discover_controller.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class EventAndRestaurants extends StatelessWidget {
   EventAndRestaurants({super.key});
final discoverController=Get.put(DiscoverController());
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 10, // Spacing between rows
        crossAxisSpacing: 15, // Spacing between columns
        children: List.generate(
        20,
        (index) => GestureDetector(
          onTap:(){
            discoverController.viewEventDetail('');
          },
          child: Container(
            height: 250.h,
            width: 230.w,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
        )));
  }
}
