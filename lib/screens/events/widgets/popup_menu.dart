import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/event_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';

class PopupMenu extends StatelessWidget {
   PopupMenu({super.key});
  final eventController=Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<String>(
      color: kcBackgroundColor,
      onSelected: (value) {
        if (value == 'Feedback') {
          // Handle Feedback action
        } else if (value == 'Report') {
          // Handle Report action
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'Feedback',
          child: Row(
            children: [
              const Icon(Icons.feedback_outlined,size: 24,),
              horizontalSpaceSmall,
              Text('Feedback',style: AppTextStyles.font14_400TextStyle,),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Report',
          child: Row(
            children: [
              const Icon(Icons.flag,size: 24,),
              horizontalSpaceSmall,
              Text('Report',style: AppTextStyles.font14_400TextStyle,),
            ],
          ),
        ),
      ],
      icon: const Icon(
        Icons.more_vert,
        size: 25,
      ),
    );
  }
}
