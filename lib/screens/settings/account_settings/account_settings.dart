import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pak_festive/utils/app_text_styles.dart';
import 'package:pak_festive/utils/helper.dart';
import 'package:pak_festive/widgets/common_textfield.dart';
import 'package:pak_festive/widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/common_container.dart';
import '../../../widgets/custom_appbar.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Account Settings',
        centerTitle: true,
        backNavigation: false,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5 - 30,
                child: CommonContainer(
                  child: Row(
                    children: [
                      Text(
                        'Type:',
                        style: AppTextStyles.font16_600TextStyle,
                      ),
                      horizontalSpaceTiny,
                      const Icon(
                        FontAwesomeIcons.building,
                        color: kcPrimaryColor,
                        size: 20,
                      ),
                      Text(
                        'Bussiness',
                        style: AppTextStyles.font14_400TextStyle
                            .copyWith(color: kcLightGrey),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
              verticalSpaceSmall,
              Center(
                child: Container(
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        color: kcWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: kcBlackColor.withOpacity(0.2),
                          )
                        ]),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTImFdUbPWeYlBCLUJONWvvb5D6SEiM2b1N0RBv_O2-v-ykwAP4cKKUjdo29FhoIEZ0zHI&usqp=CAU',
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: kcPrimaryColor,
                            size: 24,
                          ),
                        ),
                      ],
                    )),
              ),
              verticalSpaceMedium,
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'Xaio Yan',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.perm_identity_rounded,
                      size: 24,
                    )),
                borderSide: BorderSide.none,
              ),
              verticalSpaceSmall,
              CustomTextField(
                controller: TextEditingController(),
                hintText: 'example@gmail.com',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email_outlined,
                      size: 24,
                    )),
                borderSide: BorderSide.none,
              ),
              verticalSpaceSmall,
              CustomTextField(
                controller: TextEditingController(),
                hintText: '07436958435',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone_in_talk_outlined,
                      size: 24,
                    )),
                borderSide: BorderSide.none,
              ),
              verticalSpaceSmall,
              CustomTextField(
                controller: TextEditingController(),
                hintText: '12 Mar 2002',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      size: 24,
                    )),
                borderSide: BorderSide.none,
              ),
              verticalSpaceMedium,
              CustomButton(
                onClick: () {},
                btnText: 'Edit Account',
                bgColor: kcPrimaryColor,
              ),
              verticalSpaceSmall,
              CustomButton(
                onClick: () {},
                btnText: 'Delete Account',
                bgColor: kcErrorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
