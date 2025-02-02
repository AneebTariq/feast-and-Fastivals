import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pak_festive/screens/discover_screens/widgets/event_and_restaurants.dart';
import 'package:pak_festive/screens/discover_screens/widgets/search_filters.dart';
import '../../utils/app_colors.dart';
import '../../utils/helper.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/custom_appbar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Discover',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300.w,
                  child: CustomTextField(
                    controller: TextEditingController(),
                    hintText: 'Search',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon:  const Icon(
                          Icons.search_rounded,
                          size: 24,
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showAlert(
                        dialogType: DialogType.noHeader,
                        title: '',
                        dialogBody: SearchFilters(),
                        onOkPress: (){

                        }
                      );
                    },
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      size: 35,
                    )),
              ],
            ),
            verticalSpaceSmall,
            verticalSpaceSmall,
            const EventAndRestaurants(),
          ],
        ),
      )),
    );
  }
}
