import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_banners/super_banners.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class HiTeaBuffet extends StatelessWidget {
  HiTeaBuffet({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: 400.w,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeController.buffet.length,
          itemBuilder: (context,index){
            return  GestureDetector(
              onTap: () {
                _showFullScreenImage(
                    context, homeController.buffet[index]);
              },
              child: Container(
                width: 300.w,
                margin: EdgeInsets.only(right: 15.h,bottom: 5.h,top: 5.h),
                decoration: BoxDecoration(
                    color: kcWhiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: kcBlackColor.withOpacity(0.2)
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: kcWhiteColor,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(100),bottomRight: Radius.circular(100),topLeft:Radius.circular(15),bottomLeft: Radius.circular(15) ),
                        image: DecorationImage(
                          image: NetworkImage(
                              '${homeController.buffet[index]}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpaceMedium,
                          verticalSpaceTiny,
                          Text(
                            'IFTAR BUFFET',
                            style: AppTextStyles.font16_600TextStyle,
                          ),
                          verticalSpaceTiny,
                          Text(
                            '20+ ITEMS',
                            style: AppTextStyles.font12_400TextStyle,
                          ),
                          verticalSpaceTiny,
                          Text(
                            'Kohanoor, Block 1',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.font12_400TextStyle,
                          ),
                          verticalSpaceTiny,
                          Text(
                            'Rs 2199',
                            style: AppTextStyles.font14_600TextStyle,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpaceSmall,
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
