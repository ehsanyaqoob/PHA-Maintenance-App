import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            AppBackground(),

            AppBackButton(),
        
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.appLogo,
                    width: 140.w,
                    height: 140.h,
                  ),
                  PHAText(
                    text: AppConstants.phaMaintenanceService,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),

                  PHATextFormField(
                    hint: AppConstants.typeYourCNIC,
                    title: AppConstants.enterYourCNIC,
                    // inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CNICInputFormatter(),
                    ],
                    onChanged: controller.onCNICChange,
                    prefix: TextFieldIcon(
                        icon: AppAssets.imgCNIC, color: AppColors.lightGray_1),
                  ),
                  const SizedBox(height: 16),
                  PHATextFormField(
                    hint: 'xxxx-xxxxxxx',
                    title: AppConstants.enterYourMobile,
                    // inputType: TextInputType.phone,
                    onChanged: controller.onPhoneChange,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      PakistaniPhoneNumberFormatter(),
                    ],
                    prefix: TextFieldIcon(
                        icon: AppAssets.imgContact, color: AppColors.lightGray_1),
                  ),
                  Spacer(),
                  PHAButton(
                    title: AppConstants.signIn,
                    onTap: controller.isBusy.value
                        ? null
                        : () async {
                            await controller.loginService();
                          },
                    topMargin: 12.sp,
                    filledColor: AppColors.primary,
                  ),
                  const SizedBox(height: 12),
                  PHAText(
                    text: AppConstants.doNotHaveMembership,
                    textAlign: TextAlign.center,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  SizedBox(height: 14),
                  GestureDetector(
                    onTap: () => Get.to(SignUpView()),
                    child: PHAText(
                      text: AppConstants.signUp,
                      color: AppColors.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  BottomMenu(),
                  // Spacer(),
                ],
              ),
            ),
            // Loader UI
            Obx(() {
              return controller.isBusy.value ? const PHALoader() : Container();
            }),
          ],
        ),
      ),
    );
  }
}

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        child: Image.asset(
          AppAssets.appBackground,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


