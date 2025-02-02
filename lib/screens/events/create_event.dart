import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pak_festive/controller/event_controller.dart';
import 'package:pak_festive/screens/events/widgets/event_create_form.dart';
import '../../utils/app_colors.dart';
import '../../utils/helper.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({super.key});
  final eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Create Event',
        centerTitle: true,
        backNavigation: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,

              /// Event Image Picker
              Center(
                child: GestureDetector(
                  onTap: eventController.pickImage,
                  child: eventController.eventImage.value == null
                      ? Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kcWhiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: kcHintColor),
                          ),
                          child: const Icon(Icons.add_a_photo_outlined,
                              color: kcSecondary, size: 40),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.file(eventController.eventImage.value!,
                              height: 120.h, width: 120.h, fit: BoxFit.cover),
                        ),
                ),
              ),
              verticalSpaceMedium,

              /// Event Form
              EventCreateForm(),
              verticalSpaceMedium,

              /// Google Map Picker
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kcLightGrey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: eventController.selectedLocation.value ??
                        const LatLng(37.7749, -122.4194),
                    zoom: 14,
                  ),
                  onTap: eventController.setEventLocation,
                  markers: eventController.selectedLocation.value != null
                      ? {
                          Marker(
                            markerId: const MarkerId("event_location"),
                            position: eventController.selectedLocation.value!,
                          ),
                        }
                      : {},
                ),
              ),

              verticalSpaceLarge,

              /// Create Event Button
              CustomButton(
                btnText: 'Create',
                onClick: eventController.onCreateEvent,
                bgColor: kcSecondary,
                textColor: kcWhiteColor,
              ),

              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
