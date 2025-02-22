import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../controller/event_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class EventCreaterDetail extends StatelessWidget {
   EventCreaterDetail({super.key});
  final eventController=Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                icon: const Icon(FontAwesomeIcons.remove,size: 25,)),
          ],
        ),
        // Profile Section
        Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kcSecondary.withOpacity(0.2),
                    width: 2.w,
                  ),
                ),
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: kcVeryLightGrey,
                  backgroundImage: const NetworkImage(
                    'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
                  ),
                ),
              ),
              verticalSpaceSmall,
              Text(
                'John Doe',
                style: AppTextStyles.font16_600TextStyle.copyWith(
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    color: kcPrimaryColor,
                    size: 16.sp,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    'Verified Organizer',
                    style: AppTextStyles.font14_400TextStyle.copyWith(
                      color: kcMediumGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceSmall,

        // Stats Card
        Container(
          padding: EdgeInsets.all(16.w),
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: kcVeryLightGrey,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: kcLightGrey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('12', 'Events Organized'),
              _buildStatItem('4.9', 'Rating'),
            ],
          ),
        ),
        verticalSpaceSmall,
        verticalSpaceTiny,

        // Contact Information
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                icon: FontAwesomeIcons.envelope,
                text: 'john.doe@example.com',
              ),
              verticalSpaceSmall,
              _buildInfoRow(
                icon: FontAwesomeIcons.phone,
                text: '+123 456 7890',
              ),
            ],
          ),
        ),
        verticalSpaceSmall,
        verticalSpaceTiny,
        // Bio Section
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: kcPrimaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Organizer',
                style: AppTextStyles.font16_600TextStyle.copyWith(
                  color: kcDarkGreyColor,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Experienced event organizer with a passion for creating memorable experiences. Specializing in cultural festivals and corporate events with 5+ years of experience in the industry.',
                style: AppTextStyles.font14_400TextStyle.copyWith(
                  color: kcMediumGrey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        // verticalSpaceSmall,
        // verticalSpaceSmall,
        // // Contact Button
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        //   child: CustomButton(
        //     onClick: (){},
        //     btnText: 'Contact Organizer',
        //     bgColor: kcSecondary,
        //     btnIcon: Padding(
        //       padding: EdgeInsets.only(left:25.w),
        //       child: const Icon(FontAwesomeIcons.whatsapp,size: 25,),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.font18_700TextStyle.copyWith(
            color: kcPrimaryColor,
          ),
        ),
        verticalSpaceTiny,
        Text(
          label,
          style: AppTextStyles.font12_500TextStyle.copyWith(
            color: kcMediumGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.sp,
          color: kcPrimaryColor,
        ),
        horizontalSpaceMedium,
        Text(
          text,
          style: AppTextStyles.font14_500TextStyle.copyWith(
            color: kcDarkGreyColor,
          ),
        ),
      ],
    );
  }
}