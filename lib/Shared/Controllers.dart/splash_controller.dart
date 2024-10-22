import 'package:get/get.dart';
import 'package:pharesidence/features/Views/Home/home_view.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SplashController extends GetxController {
  var showPhaText = false.obs;
  var showPHAText = false.obs;
  var showLogo = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  void startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    showPhaText.value = true;

    await Future.delayed(Duration(seconds: 1));
    showPHAText.value = true;

    await Future.delayed(Duration(seconds: 1));
    showLogo.value = true;

    // Show loader after the animations for 3 seconds
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;

    await Future.delayed(Duration(seconds: 1));
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // Check login status using SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // If logged in, retrieve API data from SharedPreferences
      String? apiDataString = prefs.getString('apiData');
      Map<String, dynamic>? apiData;

      if (apiDataString != null) {
        apiData = jsonDecode(apiDataString); // Decode the JSON string to a Map
      }

      // Navigate to HomeView with the API data
      Get.off(() => HomeView(apiData: apiData ?? {})); // Pass an empty map if null
    } else {
      // If not logged in, navigate to GetStartView
      Get.off(() => GetStartView());
    }
  }
}
