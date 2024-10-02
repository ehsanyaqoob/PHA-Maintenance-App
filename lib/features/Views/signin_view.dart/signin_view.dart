import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/home_view.dart';
import 'package:pharesidence/features/Views/OTP/otp_view.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_controller.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  // Define the TextEditingController for CNIC and phone inputs
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Initialize the SignInController
  final SinginController controller = Get.put(SinginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                PHAText(
                  text: 'Welcome To Digital\nPHA Residencia',
                  fontSize: 26.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: AppColors.AppPrimary,
                ),
                const Spacer(),
                // Sign-in form
                Column(
                  children: [
                    PHATextFormField(
                      controller: nameController,
                      hint: 'Type your CNIC',
                      title: 'Enter Your CNIC',
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
                      controller: phoneController, // Added phone controller
                      hint: 'xxxx-xxxxxxx',
                      title: 'Enter Your Mobile',
                      inputType: TextInputType.phone,
                      onChanged: (value) => controller.onPhoneChange(value),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // phone number formator need to be check?
                        
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
                    const SizedBox(height: 12),
                    // Sign-in button using custom PHAButton
                    Obx(() => PHAButton(
                          title: 'Sign In',
                          onTap: controller.isLoading.value
                              ? null
                              : () async {
                                  controller.isLoading.value = true;
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  String cnic = controller.cnic.value;
                                  String phone = controller.phone.value;
                                  Get.to(HomeView(cnic: cnic, phone: phone));
                                  controller.isLoading.value = false;
                                },
                          topMargin: 12.sp,
                          fillColor: true,
                        )),
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
                const Spacer(),
                // Bottom buttons: News/Events, Projects, Contact
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // News/Events button
                    GestureDetector(
                      onTap: () {
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
                        
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    // Projects button
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
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
                       
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),                    // On going button
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: const Icon(Icons.business, color: Colors.white),
                            backgroundColor: AppColors.AppPrimary,
                            radius: 30,
                          ),
                          const SizedBox(height: 8),
                          PHAText(
                            text: 'On Going',
                           
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                    // Contact button
                    GestureDetector(
                      onTap: () {
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
                          
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Loading overlay
          Obx(() {
            if (controller.isLoading.value) {
              return Container(
                color: AppColors.AppPrimary.withOpacity(0.45),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.AppPrimary),
                  ),
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
