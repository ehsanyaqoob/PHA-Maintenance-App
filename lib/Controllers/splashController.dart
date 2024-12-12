import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

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
    try {
      bool isLogin = await Storage.containKey(SessionKeys.KUSER);
      if(isLogin){
        Get.put(HomeController());
        Get.offAll(const HomeView());
      }else{
        Get.offAll(const GetStartView());
      }
      Get.offAll(isLogin ? const HomeView() : const GetStartView());
    }catch(e){
      Fluttertoast.showToast(msg: '$e');
    }
  }

  openPhaContactUs() async {
    final _url = Uri.parse('https://pha.kashpay.pk/contact-us/');
    try {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }
}
