// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pak_festive/models/login_data_model.dart';
import 'package:pak_festive/screens/auth_screens/login.dart';
import '../utils/constants.dart';


class CommonController extends GetxController {
  var isDarkTheme = false.obs;
  var selectedLanguage = "en".obs;
  final localStorage = GetStorage(Constants.keyDbName);
  var user = LoginModel();
  
  @override
  void onInit() {
    super.onInit();
    getThemeFromStorage();
  }

  Future<void> setFirstTimeOver() async {
    await localStorage.write(Constants.keyIsFirstTime, true);
  }

  Future<void> getThemeFromStorage() async {
    var res = await localStorage.read(Constants.keyIsDarkTheme);
    if (res != null) {
      isDarkTheme.value = res;
      return;
    }
    isDarkTheme.value = false;
  }

  Future<void> setDarkTheme({required bool enableDarkTheme}) async {
    await localStorage.write(Constants.keyIsDarkTheme, enableDarkTheme);
    isDarkTheme.value = enableDarkTheme;
  }


  logOutUser() async {
    await localStorage.remove(Constants.keyUser);
    Get.offAll(LoginScreen());
  }

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning! ☀️";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon! 🌤️";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening! 🌇";
    } else {
      return "Good Night! 🌙";
    }
  }

  
}
