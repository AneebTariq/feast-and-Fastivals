import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_appbar.dart';

class ScannerCode extends StatelessWidget {
  const ScannerCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(title: 'Ticket Code',centerTitle: true,backNavigation: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
