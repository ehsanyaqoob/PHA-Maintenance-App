import 'package:pharesidence/Utils/exports/exports.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            AppBackground(),

            AppBackButton(title: 'Sign Up'),

            Positioned(
              top: 24 + 35.h + 12,
              left: 26,
              right: 26,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      PHAText(
                        text: AppConstants.pleaseEnterYourDetails,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),

                      SizedBox(height: 16.h),

                      // Name field
                      PHATextFormField(
                        hint: AppConstants.typeYourName,
                        title: AppConstants.enterYourName,
                        prefix: TextFieldIcon(
                            icon: AppAssets.imgUser, color: AppColors.lightGray_1),
                        onChanged: controller.onNameChange,
                      ),

                      // CNIC field
                      PHATextFormField(
                        hint: AppConstants.typeYourCNIC,
                        title: AppConstants.enterYourCNIC,
                        onChanged: controller.onCNICChange,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CNICInputFormatter(),
                        ],
                        prefix: TextFieldIcon(
                            icon: AppAssets.imgCNIC, color: AppColors.lightGray_1),
                        topPadding: 12,
                      ),

                      // Phone number field
                      PHATextFormField(
                        hint: AppConstants.typeYourMobile,
                        title: AppConstants.enterYourMobile,
                        onChanged: controller.onPhoneChange,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          PakistaniPhoneNumberFormatter(),
                        ],
                        prefix: TextFieldIcon(
                            icon: AppAssets.imgCNIC, color: AppColors.lightGray_1),
                        topPadding: 12,
                      ),

                      // Email field
                      PHATextFormField(
                        hint: AppConstants.typeYourEmail,
                        title: AppConstants.enterYourEmail,
                        onChanged: controller.onEmailChange,
                        prefix: TextFieldIcon(
                            icon: AppAssets.imgEmail, color: AppColors.lightGray_1),
                        topPadding: 12,
                      ),

                      // Password field
                      PHATextFormField(
                        hint: AppConstants.typeYourPassword,
                        title: AppConstants.enterYourPassword,
                        onChanged: controller.onPasswordChange,
                        prefix: TextFieldIcon(
                            icon: AppAssets.imgLock, color: AppColors.lightGray_1),
                        topPadding: 12,
                      ),

                      // PHATextFormField(
                      //   hint: AppConstants.typeYourPassword,
                      //   title: AppConstants.confirmPassword,
                      //   prefix: TextFieldIcon(
                      //       icon: AppAssets.imgLock, color: AppColors.lightGray_1),
                      //   topPadding: 12,
                      // ),

                      SizedBox(height: 24),

                      // Sign Up button
                      PHAButton(
                        title: AppConstants.signUp,
                        onTap: () => controller.signUpService(),
                        filledColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}