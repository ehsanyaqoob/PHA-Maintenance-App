import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';
import 'package:pharesidence/Shared/Controllers.dart/signin_controller.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  /// SignIn Controller ///
  final SigninController controller = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children: [
          // Background Logo
          Positioned.fill(
            child: Image.asset(
              'assets/png/back.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                Column(
                  children: [
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
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/png/icon_cnic_card.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xffB3B3B3),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Added spacing for better layout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: const Icon(Icons.event, color: Colors.white),
                            backgroundColor: AppColors.AppPrimary,
                            radius: 30,
                          ),
                          const SizedBox(height: 8),
                          PHAText(
                            text: 'News/Events',
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {}, // Fixed tap functionality for another button
                      child: Container(
                        width: 30, // Adjusted width for better alignment
                        height: 30,
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/png/icon_phone_bold.svg',
                          colorFilter: const ColorFilter.mode(
                            Color(0xffB3B3B3),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Obx(() => PHAButton(
                      title: 'Sign In',
                      onTap: controller.isLoading.value
                          ? null
                          : () async {
                              await controller.signInUser();
                            },
                      topMargin: 12.sp,
                      fillColor: true,
                    )),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PHAText(
                      text: 'Don\'t have membership?',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    PHAText(
                      text: 'Sign Up',
                      color: const Color(0xff2E81A4),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
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
                const SizedBox(height: 20), // Added some spacing
              ],
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Container(
                color: AppColors.AppPrimary.withOpacity(0.45),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ],
      ),
    );
  }
}
