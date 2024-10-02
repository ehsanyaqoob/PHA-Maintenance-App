import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/home_view.dart';
import 'package:pharesidence/features/Views/OTP/otp_view.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_controller.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';
import 'package:url_launcher/url_launcher.dart';
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  var controller = Get.put(SinginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/png/img_background.jpeg'),
                  fit: BoxFit.fitHeight),
            ),
          ),

          // Black overlay layer on top
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                PHAText(
                  text: 'Welcome To Digital Pakistan Housing Authority (PHA)',
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const Spacer(),

                // Sign-in form
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      PHATextFormField(
                        controller: nameController,
                        hint: 'Type your CNIC',
                        title: 'CNIC',
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CNICInputFormatter(),
                        ],
                        onChanged: (value) => controller.onCNICChange(value),
                        prefix: const Icon(
                          Icons.contact_phone,
                          color: AppColors.greycolor,
                          size: 25,
                        ),
                      ),

                      const SizedBox(height: 16),

                      PHATextFormField(
                        hint: 'xxxx-xxxxxxx',
                        title: 'Mobile #',
                        inputType: TextInputType.phone,
                        onChanged: (value) => controller.onPhoneChange(value),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          PakistaniPhoneNumberFormatter(),
                        ],
                        prefix: const Icon(
                          Icons.phone,
                          color: AppColors.greycolor,
                          size: 25,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Forgot password link
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(OtpView());
                            },
                            child: PHAText(
                              text: 'Forgot Password?',
                              fontSize: 16,
                              color: AppColors.AppPrimary,
                            ),
                          ),
                        ],
                      ),

                      // Sign-in button
                      PHAButton(
                        title: 'Sign In',
                        onTap: () {
                          // Start loading
                          _handleSignIn();
                        },
                        topMargin: 12.sp,
                        fillColor: true,
                      ),

                      const SizedBox(height: 12),

                      // Sign-up link
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpView());
                        },
                        child: Row(
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
                              color: AppColors.AppPrimary,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Bottom buttons: News/Events, Projects, Contact
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // News/Events button
                    GestureDetector(
                      onTap: () async {
                        // Handle tap
                      },
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
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),

                    // Projects button
                    GestureDetector(
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: const Icon(Icons.business, color: Colors.white),
                            backgroundColor: AppColors.AppPrimary,
                            radius: 30,
                          ),
                          const SizedBox(height: 8),
                          PHAText(
                            text: 'Projects',
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),

                    // Contact button
                    GestureDetector(
                      onTap: () async {
                        // Handle tap
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: const Icon(Icons.phone, color: Colors.white),
                            backgroundColor: AppColors.AppPrimary,
                            radius: 30,
                          ),
                          const SizedBox(height: 8),
                          PHAText(
                            text: 'Contact',
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Loading overlay using Obx
          Obx(() {
            if (controller.isLoading.value) {
              return Container(
                color: AppColors.AppPrimary.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.AppPrimary),
                  ),
                ),
              );
            }
            return SizedBox.shrink(); // Returns an empty widget when not loading
          }),
        ],
      ),
    );
  }

  void _handleSignIn() async {
    // Start loading
    controller.isLoading.value = true;

    // Simulate a network call or processing
    await Future.delayed(const Duration(seconds: 2));

    // Get the CNIC and phone number from the controller
    String cnic = controller.cnic.value;
    String phone = controller.phone.value;

    // Navigate to the HomeView
    Get.to(HomeView(cnic: cnic, phone: phone));

    // Stop loading (not strictly necessary since you are navigating away)
    controller.isLoading.value = false;
  }
}
