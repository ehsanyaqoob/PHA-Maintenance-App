import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_chechkobx.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_view.dart';

import '../../../Generic_Widgets/Radio_Button/pha_radio_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the SignUpController using GetX
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
       backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Sign Up',
        onLeadingPressed: () {
          Navigator.pop(context);
        },
        // backgroundColor: AppColors.AppSecondary,
        elevation: 0,
        titleColor: AppColors.appBlack,
        centerTitle: false,
      ),
      body: Stack(
        children: [

          Positioned(
            top: 0, left: 0, right: 0, bottom: 0,
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),


          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    PHAText(
                      text: 'Please enter your details to sign up',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: 12),

                    // Name field
                    PHATextFormField(
                      controller: controller.nameController,
                      hint: 'Name',
                      inputType: TextInputType.name,
                      prefix: Icon(
                        Icons.person,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 20),

                    // CNIC field
                    PHATextFormField(
                      controller: controller.cnicController,
                      hint: 'CNIC',
                      inputType: TextInputType.number,
                      prefix: Icon(
                        Icons.perm_identity,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Phone number field
                    PHATextFormField(
                      controller: controller.phoneNumberController,
                      hint: 'Phone Number',
                      inputType: TextInputType.phone,
                      prefix: Icon(
                        Icons.phone,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email field
                    PHATextFormField(
                      controller: controller.emailController,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      prefix: Icon(
                        Icons.email,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password field
                    Obx(() => PHATextFormField(
                      controller: controller.passwordController,
                      hint: 'Password',
                      isObscure: !controller.isPasswordVisible.value,
                      prefix: Icon(
                        Icons.lock,
                        color: AppColors.greycolor,
                        size: 25,
                      ),
                      suffix: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.greycolor,
                          size: 25,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    )),
                    SizedBox(height: 20),
                    // Radio buttons for Tenant or Owner
                    PHARadioButton(
                      items: ['Tenant', 'Owner'],
                      selectedValue: 'Tenant', 
                      onSelected: (value) {
                        print('Selected: $value');
                      },
                    ),
                     SizedBox(height: 20),
                    // Remember me checkbox
                    // Obx(() => Row(
                    //   children: [
                    //     CustomCheckbox(
                    //       value: controller.rememberMe.value,
                    //       onChanged: (bool newValue) {
                    //         controller.toggleRememberMe();
                    //       },
                    //       activeColor: AppColors.AppPrimary,
                    //       checkColor: AppColors.whiteColor,
                    //       size: 24.0,
                    //     ),
                    //     SizedBox(width: 8),
                    //     PHAText(
                    //       text: 'Remember me',
                    //       fontSize: 18,
                    //       color: AppColors.greycolor,
                    //     ),
                    //   ],
                    // )),
                    // SizedBox(height: 10),

                    // Divider
                    // Divider(
                    //   thickness: 3,
                    //   color: AppColors.AppPrimary,
                    // ),
                    // SizedBox(height: 24),

                    // Sign Up button
                    PHAButton(
                      title: 'Sign Up',
                      onTap: () {
                        // Perform sign-up logic here
                        print('Sign Up button tapped');
                    
                      },
                      filledColor: Color(0xff2E81A4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Loading overlay, uncomment when implementing real sign-up process
          // if (isLoading)
          //   Container(
          //     color: Colors.black.withOpacity(0.5),
          //     child: Center(
          //       child: CircularProgressIndicator(
          //         valueColor: AlwaysStoppedAnimation<Color>(AppColors.AppPrimary),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}