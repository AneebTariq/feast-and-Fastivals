import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/screens/deals_offers/widgets/show_full_image.dart';
import 'package:pak_festive/widgets/custom_appbar.dart';
import '../../controller/home_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/helper.dart';

class AllHiTeaBuffets extends StatelessWidget {
  AllHiTeaBuffets({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Hi Tea & Buffets',
        centerTitle: true,
        backNavigation: false,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              verticalSpaceSmall,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeController.buffet.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () {
                        showFullScreenImage(
                            context, homeController.buffet[index]);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 160.h,
                        margin: EdgeInsets.only(bottom: 15.h),
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
                              width: 140.w,
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
                                    style: AppTextStyles.font14_400TextStyle,
                                  ),
                                  verticalSpaceTiny,
                                  Text(
                                    'Kohanoor, Block 1',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.font14_400TextStyle,
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
            ],
          ),
        ),
      ),
    );
  }
}
