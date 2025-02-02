import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../widgets/custom_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(title: 'Notifications',centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              verticalSpaceSmall,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical:10.h),
                      margin: EdgeInsets.only(bottom: 15.h),
                      decoration: BoxDecoration(
                        // gradient: kcPrimaryGradient,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: kcLightGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              index % 2 == 0
                              ?const CircleAvatar(
                                backgroundColor: kcWhiteColor,
                                backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
                              )
                              :Image.asset(
                               'assets/images/logo.png',
                                height: 40.h,
                                width: 40.w,
                                fit: BoxFit.cover,
                              ),
                              horizontalSpaceSmall,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'This new curse info',
                                      style: AppTextStyles.font16_600TextStyle
                                          .copyWith(color: kcBlackColor),
                                    ),
                                    verticalSpaceTiny,
                                    Text(
                                      'this new cusre info dhfbfgd vfv jkna ufg duv u  djvdu dus sdjis  fud fiudf sdn iun fdids iddn dj fiuf n  isd fn9   f diind ndn ',
                                      style: AppTextStyles.font14_400TextStyle
                                          .copyWith(
                                          color: kcBlackColor
                                              .withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${index + 1} day ago.',
                                style: AppTextStyles.font12_400TextStyle
                                    .copyWith(color: kcLightGrey),
                              ),
                            ],
                          )
                        ],
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
