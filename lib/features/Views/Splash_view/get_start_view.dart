import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Dummy/News/Events/news_events.dart';
import 'package:pharesidence/Dummy/PHAProjects/pha_project_cities.dart';
import 'package:url_launcher/url_launcher.dart';
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
  // func for opening external browser

  void _openPhaContactUs() async {
    final _url = Uri.parse('https://pha.kashpay.pk/contact-us/');
    try {
      // Use launchUrl with error handling
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }

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
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                PHAText(
                  text: 'Ministry of Housing and Works',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                PHAButton(
                  title: 'Sign In',
                  onTap: () {
                    Get.to(SignInView());
                  },
                ),
                SizedBox(height: 10.h),
                PHAText(
                  text: "Don't have a membership?",
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
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
                      onTap: () {
                        Get.to( EventsScreen());
                      },
                    ),
                    BottomTab(
                      image: 'assets/png/icon_building.svg',
                      label: 'Projects',
                      onTap: () {
                  Get.to(ProjectCities());
                      },
                    ),
                    BottomTab(
                      image: 'assets/png/icon_phone.svg',
                      label: 'Contact',
                      onTap: () async {
                        _openPhaContactUs();
                      },
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
  final String image;
  final String label;
  final VoidCallback onTap;

  const BottomTab({
    super.key,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2E2D74),
            ),
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
