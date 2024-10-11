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
      body: Stack(
        children: [
        // Background Logo
          Positioned.fill(
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Middle Logo with animation
                Obx(() => AnimatedOpacity(
                      opacity: controller.showLogo.value ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: AnimatedScale(
                        scale: controller.showLogo.value ? 1.0 : 0.8,
                        duration: const Duration(milliseconds: 800),
                        child: Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/png/logo.png',
                            width: 140.w,
                            height: 140.h,
                            color: AppColors.AppPrimary,
                          ),
                        ),
                      ),
                    )),

                // Texts and animation below the logo
                SizedBox(height: 20.h),
                Obx(() => AnimatedOpacity(
                      opacity: controller.showPhaText.value ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: AnimatedScale(
                        scale: controller.showPhaText.value ? 1.0 : 0.9,
                        duration: const Duration(milliseconds: 700),
                        child: PHAText(
                          textAlign: TextAlign.center,
                          text: 'PHAF Maintenance Services',
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFEAEAEA),
                        ),
                      ),
                    )),
                SizedBox(height: 10.h),
                Obx(() => AnimatedOpacity(
                      opacity: controller.showPHAText.value ? 1.0 : 0.0,
                      duration: const Duration(seconds: 1),
                      child: AnimatedScale(
                        scale: controller.showPHAText.value ? 1.0 : 0.95,
                        duration: const Duration(milliseconds: 700),
                        child: Text(
                          'Ministry of Housing and Works',
                          style: GoogleFonts.balsamiqSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFEAEAEA),
                          ),
                        ),
                      ),
                    )),

                // Loading Spinner and text
                SizedBox(height: 50.h),
                const SpinKitFadingCircle(
                  color: Color(0xFFEAEAEA),
                  size: 50,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Please wait, loading ...',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
