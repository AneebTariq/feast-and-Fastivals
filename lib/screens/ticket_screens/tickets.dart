import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pak_festive/controller/ticket_controller.dart';
import 'package:pak_festive/utils/helper.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_appbar.dart';

class TicketsScreen extends StatelessWidget {
  TicketsScreen({super.key});

  final ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Tickets',
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

              /// **Ticket Filter Tabs (Active & Past)**
              Obx(
                  ()=> Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: kcVeryLightGrey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      /// Active Tickets Button
                      Expanded(
                        child: GestureDetector(
                          onTap: ticketController.onActiveTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: ticketController.isActiveSelected.value
                                  ? kcPrimaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.confirmation_number,
                                    color: ticketController.isActiveSelected.value
                                        ? kcWhiteColor
                                        : kcBlackColor),
                                SizedBox(width: 8.w),
                                Text(
                                  'Active Tickets',
                                  style: AppTextStyles.font16_600TextStyle
                                      .copyWith(
                                    color: ticketController.isActiveSelected.value
                                        ? kcWhiteColor
                                        : kcBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// Past Tickets Button
                      Expanded(
                        child: GestureDetector(
                          onTap: ticketController.onPastTap,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: ticketController.isActiveSelected == false
                                  ? kcPrimaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.history,
                                    color: ticketController.isActiveSelected ==
                                        false
                                        ? kcWhiteColor
                                        : kcBlackColor),
                                SizedBox(width: 8.w),
                                Text(
                                  'Past Tickets',
                                  style: AppTextStyles.font16_600TextStyle
                                      .copyWith(
                                    color: ticketController.isActiveSelected ==
                                        false
                                        ? kcWhiteColor
                                        : kcBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              verticalSpaceMedium,

              /// Tickets List
              Obx(() => ticketController.isActiveSelected.value
                  ? ticketController.activeTickets.isEmpty
                  ? const Center(child: Text("No Active Tickets"))
                  : _buildTicketList(ticketController.activeTickets)
                  : ticketController.pastTickets.isEmpty
                  ? const Center(child: Text("No Past Tickets"))
                  : _buildTicketList(ticketController.pastTickets)),
            ],
          ),
        ),
      ),
    );
  }

  /// **Builds the Ticket List UI**
  Widget _buildTicketList(List<String> tickets) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.confirmation_number_outlined, color: kcPrimaryColor),
          title: Text(tickets[index],
              style: AppTextStyles.font16_600TextStyle.copyWith(
                color: kcBlackColor,
              )),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: kcHintColor),
        );
      },
    );
  }
}
