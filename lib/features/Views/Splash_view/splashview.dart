import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      // Gradient background with dark colors
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.AppPrimary, Color(0xFF16213E)], // Dark primary and secondary colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated logo with scale and fade-in effect
              Obx(() => AnimatedOpacity(
                    opacity: controller.showLogo.value ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showLogo.value ? 1.0 : 0.8,
                      duration: Duration(milliseconds: 800),
                      child: Container(
                        height: 170.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/png/logo.png',
                          width: 200.w,
                          height: 180.h,
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 20.h), // Space between logo and text

              // Animated "PHA Foundation Residence" text with subtle scaling
              Obx(() => AnimatedOpacity(
                    opacity: controller.showPhaText.value ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showPhaText.value ? 1.0 : 0.9,
                      duration: Duration(milliseconds: 700),
                      child: PHAText(
                        textAlign: TextAlign.center,
                        text: 'PHA Officers\'s Residencia \n Maintenance Services',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAEAEA), // Light text color for contrast
                      ),
                    ),
                  )),
              SizedBox(height: 10.h), // Space between texts

              // Animated "Ministry of Housing and Works" text
              Obx(() => AnimatedOpacity(
                    opacity: controller.showPHAText.value ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showPHAText.value ? 1.0 : 0.95,
                      duration: Duration(milliseconds: 700),
                      child: Text(
                        'Ministry of Housing and Works',
                        style: GoogleFonts.balsamiqSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFEAEAEA), // Light text color for contrast
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 50.h), // Space between text and loader

              // Loader spinner with adjusted size and position
              SpinKitFadingCircle(
                color: Color(0xFFEAEAEA), // Light color for loader
                size: 50.w,
              ), // Loader is always visible
            ],
          ),
        ),
      ),
    );
  }
}
