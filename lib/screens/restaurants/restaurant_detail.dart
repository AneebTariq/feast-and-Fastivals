import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/restaurant_controller.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_appbar.dart';

class RestaurantDetailScreen extends StatelessWidget {
   RestaurantDetailScreen({super.key,required this.title});
  final restaurantController=Get.put(RestaurantController());
final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: CustomAppBar(title: title,centerTitle: true,backNavigation: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
