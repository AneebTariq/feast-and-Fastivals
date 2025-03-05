import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/helper.dart';
import '../../../widgets/custom_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      appBar: const CustomAppBar(title: 'Privacy Policy',centerTitle: true,backNavigation: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              Text(
                'Welcome to Languages',
                style: AppTextStyles.font18_600TextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'This Privacy Policy explains how [Your App Name] collects, uses, and discloses information about you when you use our mobile application ("App"). By using the App, you consent to the collection and use of information as described in this Privacy Policy.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 24),
              Text(
                '1. Information We Collect',
                style: AppTextStyles.font18_600TextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'We may collect the following types of information:',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Personal Information:** This may include your name, email address, phone number, date of birth, and other information you voluntarily provide to us, such as when you create an account or contact us.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Device Information:** We may collect information about the device you use to access the App, such as your device type, operating system, and unique device identifiers.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Usage Information:** We may collect information about how you use the App, such as the features you access, the content you view, and the actions you take within the App.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 24),
              Text(
                '2. How We Use Your Information',
                style: AppTextStyles.font18_600TextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'We may use the information we collect to:',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Provide and maintain the App.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Personalize your experience with the App.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Communicate with you about the App and our services.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Respond to your inquiries and requests.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Improve the App and our services.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• Protect the security and integrity of the App.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 24),
              Text(
                '3. Data Sharing',
                style: AppTextStyles.font18_600TextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'We may share your information with:',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Service Providers:** We may share your information with third-party service providers who assist us in providing the App, such as data analysis, marketing, and customer support.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Business Partners:** We may share your information with our business partners for marketing and promotional purposes.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Legal Requirements:** We may disclose your information to comply with applicable laws, regulations, legal processes, or governmental requests.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                '• **Business Transfers:** If we are involved in a merger, acquisition, or sale of assets, your information may be transferred to the acquiring entity.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              const SizedBox(height: 24),
              Text(
                '4. Data Security',
                style: AppTextStyles.font18_600TextStyle,
              ),
              const SizedBox(height: 16),
              Text(
                'We take reasonable steps to protect your information from unauthorized access, use, and disclosure. However, no method of transmission over the internet, or method of electronic storage, is 100% secure.',
                style: AppTextStyles.font16_400TextStyle,
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
