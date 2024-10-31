import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
                      onTap: () {
                        Get.to(const EventsView());
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

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Events and News ',
        backgroundColor: AppColors.AppSecondary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return EventCard(
            title: 'Event ${index + 1}',
            date: 'Date: ${index + 1}/10/2024',
            description: 'Description for event ${index + 1}.',
          );
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  const EventCard({
    required this.title,
    required this.date,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.blue.withOpacity(0.5), // Example shadow color
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff2E2D74),
              const Color(0xff2E81A4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
