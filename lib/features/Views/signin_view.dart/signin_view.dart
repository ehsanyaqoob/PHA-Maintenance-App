import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Dummy/PHAProjects/pha_project_cities.dart';

import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Shared/Controllers.dart/signin_controller.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';
import 'package:url_launcher/url_launcher.dart';


class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
  final SigninController controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.AppSecondary,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    PHATextFormField(
                      controller: TextEditingController(),
                      hint: 'Type your CNIC',
                      title: 'Enter Your CNIC',
                      inputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CNICInputFormatter(),
                      ],
                      onChanged: controller.onCNICChange,
                      prefix: Container(
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/png/icon_cnic_card.svg',
                          colorFilter: ColorFilter.mode(Color(0xffB3B3B3), BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    PHATextFormField(
                      controller: TextEditingController(),
                      hint: 'xxxx-xxxxxxx',
                      title: 'Enter Your Mobile',
                      inputType: TextInputType.phone,
                      onChanged: controller.onCellChange,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        PakistaniPhoneNumberFormatter(),
                      ],
                      prefix: Container(
                        width: 15,
                        height: 15,
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/png/icon_phone_bold.svg',
                          colorFilter: ColorFilter.mode(Color(0xffB3B3B3), BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    PHAButton(
                      title: 'Sign In',
                      onTap: controller.isLoading.value
                          ? null
                          : () async {
                              await controller.signInUser();
                            },
                      topMargin: 12.sp,
                      fillColor: true,
                    ),
                    const SizedBox(height: 12),
                    PHAText(
                      text: 'Don\'t have membership?',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpView());
                      },
                      child: PHAText(
                        text: 'Sign Up',
                        color: Color(0xff2E81A4),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Loader UI
            Obx(() {
              
              return controller.isLoading.value ? const PHALoader() : Container();
            }),
          ],
        ),
      ),
    );
  }
}