import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/settings_controller.dart';
import 'package:pak_festive/screens/settings/widgets/setting_list_widget.dart';
import 'package:pak_festive/utils/app_colors.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../widgets/custom_appbar.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({super.key});
final settingController=Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
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
                  onClick: settingController.onAccountDetail,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Create Event',
                  subTitle: 'Available Events: 2',
                  firstIcon: FontAwesomeIcons.calendarPlus,
                  firstIconClr: kcAccentBlueColor,
                  onClick: settingController.onCreateEvent,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Create Restaurant',
                  firstIcon: FontAwesomeIcons.utensils,
                  firstIconClr: kcSecondary,
                  onClick: settingController.onCreateRestaurant,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Tickets',
                  subTitle: 'Active Tickets: 2',
                  firstIcon: Icons.airplane_ticket,
                  firstIconClr: kcWarning,
                  onClick: settingController.onTickets,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Ticket Scanner',
                  firstIcon: Icons.document_scanner_outlined,
                  firstIconClr: kcInfo,
                  onClick: settingController.onTicketScanner,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Privacy Policy',
                  firstIcon: Icons.privacy_tip,
                  firstIconClr: kcErrorColor,
                  onClick: settingController.onPrivacyPolicy,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Share with Friends',
                  firstIcon: Icons.share,
                  firstIconClr: kcSuccess,
                  onClick: settingController.onShareApp,
                ),
                verticalSpaceSmall,
                SettingListWidget(
                  title: 'Feedback',
                  firstIcon: Icons.feedback,
                  firstIconClr: kcLightGrey,
                  onClick: settingController.onFeedBack,
                ),
              ],
            ),
          )
      ),
    );
  }
}
