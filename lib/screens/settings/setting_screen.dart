import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/screens/settings/widgets/setting_list_widget.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../widgets/custom_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings',centerTitle: true,),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Account Settings',
                  firstIcon: Icons.person,
                  firstIconClr: kcPrimaryColor,
                  onClick: (){
                  },
                ),
                verticalSpaceMedium,
                SettingListWidget(
                  title: 'Tickets',
                  firstIcon: Icons.airplane_ticket,
                  firstIconClr: kcOrangeColor,
                  onClick: (){
                  },
                ),
                verticalSpaceMedium,
                SettingListWidget(
                  title: 'Ticket Scanner',
                  firstIcon: Icons.document_scanner_outlined,
                  firstIconClr: kcBlueColor,
                  onClick: (){
                  },
                ),
                verticalSpaceMedium,
                SettingListWidget(
                  title: 'Privacy Policy',
                  firstIcon: Icons.privacy_tip,
                  firstIconClr: kcRedColor,
                  onClick: (){
                  },
                ),
                verticalSpaceMedium,
                SettingListWidget(
                  title: 'Share',
                  firstIcon: Icons.share,
                  firstIconClr: kcGreenColor,
                  onClick: (){
                  },
                ),
                verticalSpaceMedium,
                SettingListWidget(
                  title: 'Feedback',
                  firstIcon: Icons.feedback,
                  firstIconClr: kcLightGrey,
                  onClick: (){
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
