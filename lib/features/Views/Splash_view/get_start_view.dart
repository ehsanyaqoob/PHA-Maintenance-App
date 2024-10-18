import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_view.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';

class GetStartView extends StatefulWidget {
  const GetStartView({super.key});

  @override
  State<GetStartView> createState() => _GetStartViewState();
}

class _GetStartViewState extends State<GetStartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Spacer(),
                SvgPicture.asset(
                  'assets/png/icon_app_logo.svg',
                  width: 140.w,
                  height: 140.h,
                ),
                PHAText(
                  text: 'PHAF Maintenance Service',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PHAButton(
                  title: 'Sign In',
                  onTap: () {
                    Get.to(SignInView());
                  },
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {},
                  child: PHAText(
                    text: "Don't have membership?",
                    fontSize: 13.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 4.h),
                PHAButton(
                  title: 'Sign Up',
                  filledColor: Color(0xff2E81A4),
                  onTap: () {
                    Get.to(SignUpView());
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomTab(
                      image: 'assets/png/icon_calendar.svg',
                      label: 'News/Events',
                      onTap: () {},
                    ),
                    BottomTab(
                      image: 'assets/png/icon_building.svg',
                      label: 'Projects',
                      onTap: () {},
                    ),
                    BottomTab(
                      image: 'assets/png/icon_phone.svg',
                      label: 'Contact',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  String image;
  String label;
  VoidCallback onTap;
  BottomTab({super.key, required this.image, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            padding: EdgeInsets.all(16),
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xff2E2D74)),
            child: SvgPicture.asset(image),
          ),
          const SizedBox(height: 8),
          PHAText(
            text: label,
            fontSize: 12.sp,
            color: Color(0xff676767),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

