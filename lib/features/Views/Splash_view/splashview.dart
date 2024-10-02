
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.AppPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo with fade-in effect
            Obx(() => AnimatedOpacity(
                  opacity: controller.showLogo.value ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 170.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                        color: AppColors.appWhite, 
                        shape: BoxShape.circle
                    ),
                    child: Image.asset(
                      'assets/png/logo.png',
                      width: 200.w,
                      height: 180.h,
                    ),
                  ),
                )),
            SizedBox(height: 20.h), // Space between logo and text

            // Animated "PHA Foundation Residence" text
            Obx(() => AnimatedOpacity(
                  opacity: controller.showPhaText.value ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: PHAText(
                  textAlign: TextAlign.center,
                    text:'PHA Foundation Officers\'s Residencia \n Maintenance Services',
                      fontSize: 16.sp, // Clean font size
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Contrast with background
                    
                  ),
                )),
            SizedBox(height: 10.h), // Space between texts

            // Animated "Ministry of Housing and Works" text
            Obx(() => AnimatedOpacity(
                  opacity: controller.showPHAText.value ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Ministry of Housing and Works',
                    style: GoogleFonts.balsamiqSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                )),
            SizedBox(height: 60.h), // Space between text and loader

              // Always display the loader (spinner)
            SpinKitFadingCircle(
              color: Colors.white,
              size: 40.w,
            ), // Loader always visible
          ],
        ),
      ),
    );
  }
}
