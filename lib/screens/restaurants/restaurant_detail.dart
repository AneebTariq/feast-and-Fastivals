import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/restaurant_controller.dart';
import 'package:pak_festive/screens/restaurants/widgets/profile_image_background.dart';
import 'package:pak_festive/utils/helper.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImageBackground(),
              verticalSpaceSmall,
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
