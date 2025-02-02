import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pak_festive/controller/event_controller.dart';
import 'package:pak_festive/screens/events/widgets/event_creater_detail.dart';
import 'package:pak_festive/widgets/custom_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/helper.dart';
import '../../widgets/custom_appbar.dart';

class EventDetailScreen extends StatelessWidget {
  EventDetailScreen({super.key, required this.title});
  final eventController = Get.put(EventController());
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: CustomAppBar(
        title: 'Event Detail',
        centerTitle: true,
        backNavigation: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 25,
              )),
          horizontalSpaceTiny,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              // Event Image or Images
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3Vwd2s2MTY5MTk3NS13aWtpbWVkaWEtaW1hZ2Uta293YjI4OTguanBn.jpg'), // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpaceSmall,
              verticalSpaceSmall,
              // Event Name
              Text(
                'Kawali Night',
                style: AppTextStyles.font24_900TextStyle.copyWith(
                  color: kcDarkGreyColor,
                ),
              ),
              verticalSpaceSmall,

              // Ticket Details
              Row(
                children: [
                  Text(
                    'Total Tickets: 100',
                    style: AppTextStyles.font14_600TextStyle.copyWith(
                      color: kcMediumGrey,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    '|',
                    style: AppTextStyles.font14_600TextStyle.copyWith(
                      color: kcMediumGrey,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'Tickets Sold: 50',
                    style: AppTextStyles.font14_600TextStyle.copyWith(
                      color: kcMediumGrey,
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
              Text(
                'Timing: 7:00 pm - 12:00 pm ',
                style: AppTextStyles.font14_600TextStyle.copyWith(
                  color: kcMediumGrey,
                ),
              ),
              verticalSpaceSmall,

              // Ticket Price
              Text(
                'Ticket Price: \$20',
                style: AppTextStyles.font16_600TextStyle.copyWith(
                  color: kcPrimaryColor,
                ),
              ),
              verticalSpaceMedium,

              // Event Location
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: kcSecondary,
                    size: 20.sp,
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'Kohanoor block 1, Faisalabad, Pakistan',
                    style: AppTextStyles.font14_600TextStyle.copyWith(
                      color: kcDarkGreyColor,
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,

              // Event Creator Info
              GestureDetector(
                onTap: (){
                  showAlert(
                      dialogType: DialogType.noHeader, title: 'title',
                      dialogBody:const EventCreaterDetail(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical:16.h,horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: kcVeryLightGrey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: const NetworkImage(
                            'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'), // Replace with creator's image
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Event Creator Name',
                            style: AppTextStyles.font16_600TextStyle.copyWith(
                              color: kcDarkGreyColor,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text(
                            '+9231234567',
                            style: AppTextStyles.font14_400TextStyle.copyWith(
                              color: kcMediumGrey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: (){},
                          icon: const Icon(Icons.more_vert,size: 25,),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,

              // Event Description
              Text(
                'Join us for an unforgettable experience at [Event Name]!'
                ' This exciting event features live performances, '
                'engaging activities, and a vibrant atmosphere perfect for all attendees.'
                ' With a limited number of tickets available, be sure to secure yours early! '
                'Enjoy delicious food, great music, and networking opportunities while exploring the event venue.'
                ' Don\'t miss out on this fantastic opportunity to create lasting memories.'
                ' See you at [Event Location] on [Event Date]!',
                style: AppTextStyles.font14_400TextStyle.copyWith(
                  color: kcDarkGreyColor,
                ),
              ),
              verticalSpaceMedium,

              // Map Container
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kcLightGrey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(31.4134853, 73.1118539),
                      zoom: 14,
                    ),
                    markers: {
                      const Marker(
                        markerId: MarkerId("event_location"),
                        position: LatLng(4134853, 73.1118539),
                        infoWindow: InfoWindow(title: "Event Location"),
                      ),
                    },
                  ),
                ),
              ),
              verticalSpaceMedium,
              // Buy Ticket Button
              CustomButton(
                onClick: () {},
                btnText: 'Buy Ticket',
                bgColor: kcSecondary,
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
