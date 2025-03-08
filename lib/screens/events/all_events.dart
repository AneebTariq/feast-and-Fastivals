import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/event_controller.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';

import '../../utils/app_text_styles.dart';
import '../../utils/helper.dart';

class AllEvents extends StatelessWidget {
   AllEvents({super.key});
  final eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'All Events',
        centerTitle: true,
        backNavigation: false,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: StaggeredGrid.count(
              crossAxisCount: 2, // Number of columns
              mainAxisSpacing: 10, // Spacing between rows
              crossAxisSpacing: 15, // Spacing between columns
              children: List.generate(
                  eventController.events.length,
                      (index) => GestureDetector(
                    onTap: () {
                      eventController.viewEventDetail('');
                    },
                    child: Container(
                      height: index.isEven ? 210.h : 280.h,
                      width: index.isEven ? 230.w : 250.w,
                      decoration: BoxDecoration(
                          color: kcPrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                          image:  DecorationImage(
                            image: NetworkImage(
                                '${eventController.events[index]}'),
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
                                  kcWhiteColor.withOpacity(0.9),
                                  kcWhiteColor.withOpacity(0.5),
                                  kcTransparent,
                                ],
                                stops:const [
                                  0.1,
                                  0.4,
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
                  ),),),
        ),
      ),
    );
  }
}
