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
      appBar: const CustomAppBar(title: 'Notifications',centerTitle: true,),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                  itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  margin: EdgeInsets.only(bottom: 10.h,right: 16.w,left: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: kcLightGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: kcWhiteColor,
                          backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
                        ),
                        title:const Text('This is new here',maxLines: 2,overflow: TextOverflow.ellipsis,),
                        titleTextStyle: AppTextStyles.font18_700TextStyle.copyWith(color: kcBlackColor ),
                        subtitle: const Text('i like this and share it with your friends and family. to enjoye more. ',),
                        subtitleTextStyle: AppTextStyles.font14_400TextStyle.copyWith(color: kcLightGrey),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('02:00 PM',style: AppTextStyles.font14_400TextStyle.copyWith(color: kcLightGrey),)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          )
      ),
    );
  }
}
