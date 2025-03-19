import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class GetStartView extends StatefulWidget {
  const GetStartView({super.key});
  @override
  State<GetStartView> createState() => _GetStartViewState();
}

class _GetStartViewState extends State<GetStartView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          AppBackground(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Spacer(),
                SvgPicture.asset(
                  AppAssets.appLogo,
                  width: 140.w,
                  height: 140.h,
                ),
                PHAText(
                  text: AppConstants.phaMaintenanceService,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                PHAText(
                  text: AppConstants.ministryOfHousingWork,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                PHAButton(
                  title: AppConstants.signIn,
                  filledColor: AppColors.primary,
                  onTap: () {
                    Get.to(SignInView());
                  },
                ),
                SizedBox(height: 12.h),
                PHAText(
                  text: AppConstants.doNotHaveMembership,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                PHAButton(
                  title: AppConstants.signUp,
                  filledColor: AppColors.secondary,
                  onTap: () {
                    Get.to(SignUpView());
                  },
                ),
                const Spacer(),
                BottomMenu()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SplashController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BottomTab(
          image: AppAssets.imgCalendar,
          label: AppConstants.newsEvents,
          onTap: () {
            Get.to( EventsScreen());
          },
        ),
        BottomTab(
          image: AppAssets.imgBuilding,
          label: AppConstants.projects,
          onTap: () {
            Get.to(ProjectCities());
          },
        ),
        BottomTab(
          image: AppAssets.imgContact,
          label: AppConstants.contactUs,
          onTap: () async => controller.openPhaContactUs(),
        ),
      ],
    );
  }
}
