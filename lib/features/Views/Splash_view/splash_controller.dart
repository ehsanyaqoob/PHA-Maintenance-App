import 'package:get/get.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';

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

  void navigateToNextScreen() {
    // Navigate to your next screen after splash animation ends
    Get.to(GetStartView());
  }
}
