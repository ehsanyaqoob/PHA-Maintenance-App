
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_controller.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  /// Singin Controller ///
  final SigninController controller = Get.put(SigninController());
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
                      prefix: const Icon(
                        Icons.contact_phone,
                        color: AppColors.greycolor,
                        size: 25,
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
                      prefix: const Icon(
                        Icons.phone,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Get.to(() => OtpView(cnic: '',));
                    //       },
                    //       child: PHAText(
                    //         text: 'Forgot Password?',
                    //         fontSize: 16,
                    //         color: AppColors.AppPrimary,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpView());
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
                      onTap: () {},
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
                    ),
                    GestureDetector(
                      onTap: () {},
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
                    GestureDetector(
                      onTap: () {},
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
