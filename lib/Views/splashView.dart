import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';

import 'package:pharesidence/Utils/exports/exports.dart';

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
                  AppColors.secondary,
                  AppColors.secondary,
                  AppColors.secondary,
                  AppColors.primary,
                ],
              ),
            ),
          ),

          // Background
          AppBackground(),

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
                        AppAssets.appLogo,
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
                        text: AppConstants.phaMaintenanceService.toUpperCase(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
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
                        text: AppConstants.ministryOfHousingWork,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                      ),
                    ),
                  )),

              Spacer(),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: AppColors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                    SizedBox(height: 8.h),
                    Text(AppConstants.pleaseWait,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white))
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
