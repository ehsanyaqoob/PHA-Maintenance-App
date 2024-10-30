import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xff2E2D74),
                  const Color(0xff2E2D74),
                  const Color(0xff2E2D74),
                  const Color(0xff2E81A4)
                ],
              ),
            ),
          ),

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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Middle Logo with animation
              Obx(() => AnimatedOpacity(
                    opacity: controller.showLogo.value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showLogo.value ? 1.0 : 0.8,
                      duration: const Duration(milliseconds: 800),
                      child: SvgPicture.asset(
                        'assets/png/icon_app_logo.svg',
                        width: 140.w,
                        height: 140.h,
                      ),
                    ),
                  )),

              // Texts and animation below the logo
              SizedBox(height: 4.h),
              Obx(() => AnimatedOpacity(
                    opacity: controller.showPhaText.value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showPhaText.value ? 1.0 : 0.9,
                      duration: const Duration(milliseconds: 700),
                      child: PHAText(
                        textAlign: TextAlign.center,
                        text: 'PHAF Maintenance Services'.toUpperCase(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFEAEAEA),
                      ),
                    ),
                  )),
              SizedBox(height: 2.h),
              Obx(() => AnimatedOpacity(
                    opacity: controller.showPHAText.value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: AnimatedScale(
                      scale: controller.showPHAText.value ? 1.0 : 0.95,
                      duration: const Duration(milliseconds: 700),
                      child: PHAText(
                        text: 'Ministry of Housing and Works',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFEAEAEA),
                      ),
                    ),
                  )),
              // Loading Spinner and text
              // SizedBox(height: 50.h),
              // const SpinKitFadingCircle(
              //   color: Color(0xFFEAEAEA),
              //   size: 50,
              // ),
              // SizedBox(height: 10.h),
              // Text(
              //   'Please wait, loading ...',
              //   style: TextStyle(
              //     fontSize: 14.sp,
              //     color: const Color(0xFFEAEAEA),
              //   ),
              // ),
              Spacer(),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff2E81A4)),
                    ),
                    SizedBox(height: 8.h),
                    Text('Please wait, loading...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.w400,
                            color: Colors.white))
                  ],
                ),
              ),

              Spacer(),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
