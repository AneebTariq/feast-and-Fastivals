import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/event_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/helper.dart';
import '../../../widgets/common_textfield.dart';

class EventCreateForm extends StatelessWidget {
   EventCreateForm({super.key});
  final eventController=Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Event Name
        CustomTextField(
          controller: eventController.nameController,
          hintText: 'Enter event name',
          prefix: const Icon(Icons.event, color: kcAccentBlueColor),
          bgClr: kcWhiteColor,
        ),

        verticalSpaceSmall,

        /// Total Tickets
        CustomTextField(
          controller: eventController.totalTicketsController,
          hintText: 'Total tickets available',
          keyboardType: TextInputType.number,
          prefix: const Icon(Icons.confirmation_number_outlined, color: kcWarning),
          bgClr: kcWhiteColor,
        ),

        verticalSpaceSmall,
        /// Start Time & End Time Row
        Row(
          children: [
            /// Start Time Field
            Expanded(
              child: GestureDetector(
                onTap: () => eventController.pickTime(isStartTime: true),
                child: AbsorbPointer(
                  child: CustomTextField(
                    controller: eventController.startTimeController,
                    hintText: 'Start Time',
                    prefix: const Icon(Icons.access_time, color: kcInfo),
                    bgClr: kcWhiteColor,
                  ),
                ),
              ),
            ),
            horizontalSpaceSmall,

            /// End Time Field
            Expanded(
              child: GestureDetector(
                onTap: () => eventController.pickTime(isStartTime: false),
                child: AbsorbPointer(
                  child: CustomTextField(
                    controller: eventController.endTimeController,
                    hintText: 'End Time',
                    prefix: const Icon(Icons.access_time_filled, color: kcInfo),
                    bgClr: kcWhiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        verticalSpaceSmall,

        /// Ticket Price
        CustomTextField(
          controller: eventController.ticketPriceController,
          hintText: 'Ticket price',
          keyboardType: TextInputType.number,
          prefix: const Icon(Icons.attach_money, color: kcSuccess),
          bgClr: kcWhiteColor,
        ),

        verticalSpaceSmall,

        /// Event Location
        CustomTextField(
          controller: eventController.locationController,
          hintText: 'Enter event address',
          prefix: const Icon(Icons.location_on_outlined, color: kcSecondary),
          bgClr: kcWhiteColor,
        ),

        verticalSpaceSmall,

        /// Description
        CustomTextField(
          controller: eventController.descriptionController,
          hintText: 'Enter event description',
          maxLines: 4,
          prefix: const Icon(Icons.description_outlined, color: kcPrimaryColor),
          bgClr: kcWhiteColor,
        ),
      ],
    );
  }
}
