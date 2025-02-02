import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../../controller/discover_controller.dart';

class SearchFilters extends StatelessWidget {
  SearchFilters({super.key});
  final controller = Get.put(DiscoverController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceSmall,
        Text(
          'Search Filters:',
          style: AppTextStyles.font20_600TextStyle,
        ),
        verticalSpaceMedium,
        Obx(
          () => Wrap(
            spacing: 8.0, // Horizontal spacing between widgets
            runSpacing: 8.0, // Vertical spacing between rows
            children: controller.items
                .map((item) => GestureDetector(
                      onTap: () {
                        controller.selectedFilter.value = item;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: controller.selectedFilter.value == item
                              ? kcSecondary.withOpacity(0.1)
                              : kcWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: controller.selectedFilter.value == item
                                  ? kcSecondary
                                  : kcLightGrey),
                        ),
                        child: Text(
                          item,
                          style: AppTextStyles.font16_600TextStyle.copyWith(
                              color: controller.selectedFilter.value == item
                                  ? kcSecondary
                                  : kcBlackColor),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        verticalSpaceMedium,
        Text(
          'Location Radius:',
          style: AppTextStyles.font20_600TextStyle,
        ),
        verticalSpaceMedium,
        Obx(
          () => Wrap(
            spacing: 8.0, // Horizontal spacing between widgets
            runSpacing: 8.0, // Vertical spacing between rows
            children: controller.location
                .map((item) => GestureDetector(
                      onTap: () {
                        controller.selectedLocationRadius.value = item;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: controller.selectedLocationRadius.value == item
                              ? kcSecondary.withOpacity(0.1)
                              : kcWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: controller.selectedLocationRadius.value ==
                                      item
                                  ? kcSecondary
                                  : kcLightGrey),
                        ),
                        child: Text(
                          "$item Km",
                          style: AppTextStyles.font16_600TextStyle.copyWith(
                              color: controller.selectedLocationRadius.value ==
                                      item
                                  ? kcSecondary
                                  : kcBlackColor),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
