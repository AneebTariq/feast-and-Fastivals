import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pak_festive/screens/account_settings/account_settings.dart';
import 'package:pak_festive/screens/events/create_event.dart';
import 'package:pak_festive/screens/restaurants/create_restaurant.dart';
import 'package:pak_festive/screens/scanner_screens/scanner_code.dart';
import 'package:pak_festive/screens/ticket_screens/tickets.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/privacy_policy_screen/privacy_policy.dart';
import '../utils/app_colors.dart';
import '../utils/helper.dart';

class SettingController extends GetxController{
  final InAppReview inAppReview = InAppReview.instance;
  onAccountDetail(){
    Get.to(()=>const AccountSettingsScreen());
  }
  onCreateEvent(){
    Get.to(()=> CreateEventScreen());
  }
  onCreateRestaurant(){
    Get.to(()=> CreateRestaurantScreen());
  }
  onTickets(){
    Get.to(()=> TicketsScreen());
  }
  onTicketScanner(){
    Get.to(()=> ScannerCode());
  }
  onPrivacyPolicy(){
    Get.to(()=> PrivacyPolicyScreen());
  }

  onShareApp()async{
    const appLink = 'https://play.google.com/store/apps/details?id=com.example.pak_feast';
    final result = await Share.share('Check out this app: $appLink');
    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing our App!');
      showToast('Thank you for sharing our App!', kcSuccess);
    }
  }

  onFeedBack()async{
    final isAvailable = await inAppReview.isAvailable();
    if (isAvailable) {
      inAppReview.requestReview();
    } else {
      if (Platform.isAndroid) {
        inAppReview.openStoreListing(); // Google Play Store (no ID needed)
      } else if (Platform.isIOS) {
        inAppReview.openStoreListing(appStoreId: '6441234567'); // Replace with your App Store ID
      } else if (Platform.isWindows) {
        inAppReview.openStoreListing(microsoftStoreId: '9NBLGGH4R315'); // Replace with your Microsoft Store ID
      }
    }
  }
}