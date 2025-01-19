import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/controller_binding.dart';
import 'locale/app_translation.dart';
import 'screens/welcome_screens/splash.dart';
import 'utils/constants.dart';
import 'utils/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(Constants.keyDbName);
  runApp(ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(_);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              currentFocus.unfocus(); // Dismiss the keyboard
            }
          },
          child: GetMaterialApp(
              title: Constants.appName,
              debugShowCheckedModeBanner: false,
              translations: AppTranslations(),
              locale: Get.deviceLocale,
              theme: ThemeData(
                textTheme: Typography.englishLike2018
                    .apply(fontSizeFactor: 1, bodyColor: kcBlackColor),
                fontFamily: 'ProductSans',
                scaffoldBackgroundColor: kcWhiteColor,
                primaryColor: kcPrimaryColor,
                indicatorColor: kcPrimaryColor,
                hintColor: kcHintColor,
                dividerColor: kcLightGrey,
                cardColor: kcWhiteColor,
                tabBarTheme: const TabBarTheme(
                  unselectedLabelColor: kcLightGrey,
                  labelColor: kcPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: kcPrimaryColor, width: 2.0),
                  ),
                ),
              ),
              fallbackLocale: const Locale('en'),
              initialBinding: ControllersBinding(),
              initialRoute: '/',
              getPages: [
                GetPage(name: '/', page: () => SplashScreen()),
              ]),
        );
      }));
}
