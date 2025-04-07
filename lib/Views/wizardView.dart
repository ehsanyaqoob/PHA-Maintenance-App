import 'package:pharesidence/Utils/exports/exports.dart';

class WizardView extends StatefulWidget {
  const WizardView({super.key});

  @override
  State<WizardView> createState() => _WizardViewState();
}

class _WizardViewState extends State<WizardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBackground(),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(),
                Spacer(),
                SvgPicture.asset(
                  AppAssets.appLogo,
                  width: 140.w,
                  height: 140.h,
                ),

                PHAText(
                  text: 'Welcome'.toUpperCase(),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 4),

                PHAText(
                  text: AppConstants.phaMaintenanceService,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24),

                PHAText(
                  text: 'This wizard will guide you through process of calculating and paying your maintenance charges against your property. You can pay maintenance charges via  Internet banking , ATM, IBFT or 1link/ 1Bill Member Banks',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 12),

                PHAText(
                  text: 'یہ وزرڈ آپ کی جائیداد کے حساب اور قسطوں کی ادائیگی کے عمل میں آپ کی رہنمائی کرے گا۔ آپ یہ قسطیں کسی بھی اے ٹی ایم یا آن لائن فنڈ ٹرانسفر یا 1- لنک سے منسلک کسی بھی ممبر بینک شاخ کے ذریعے ادا کر سکتے ھیں۔',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),

                Spacer(),
                Spacer(),
                Spacer(),

                GestureDetector(
                  onTap: ()=>Get.offAll(const GetStartView()),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppColors.secondary,
                          AppColors.primary,
                          // Color(0xFF2E81A4)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40.h/2),
                      // border: Border.all(
                      //   color: borderColor ?? AppColors.primary,
                      // ),
                      // color: AppColors.primary,
                      // Conditional shadow
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.85),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: PHAText(
                        text: "Get Started / شروع کریں",
                        textAlign: TextAlign.center,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}