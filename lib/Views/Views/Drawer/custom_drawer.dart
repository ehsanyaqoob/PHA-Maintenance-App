import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Shared/Prefrences/shared_pref.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/getStartedView.dart';

import '../../drawer/notifications.dart';
import '../../drawer/privacy_policy.dart';
import '../../drawer/rateus.dart';
import '../../drawer/terms_conditions.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.appLogo,
                    width: 60.w,
                    height: 60.h,
                  ),
                  SizedBox(width: 8),
                  PHAText(
                    text: 'PHAF MAINTENANCE \n SERVICES',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackGray,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.star, color: AppColors.primary, size: 30),
              title: PHAText(text: 'Rate Us', fontSize: 16.sp),
              onTap: () {
               Get.to(RateUsView()); // Navigate to Rate Us View
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.privacy_tip, color: AppColors.primary, size: 30),
              title: PHAText(text: 'Privacy Policy', fontSize: 16.sp),
              onTap: () {
                Get.to(PrivacyPolicyView()); // Navigate to Privacy Policy View
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: AppColors.primary, size: 30),
              title: PHAText(text: 'Terms & Conditions', fontSize: 16.sp),
              onTap: () {
                Get.to(
                    TermsConditionsView()); // Navigate to Terms & Conditions View
              },
            ),
            ListTile(
              leading: Stack(
                children: [
                  Icon(Icons.notifications,
                      color: AppColors.primary, size: 30),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.blue,
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              title: PHAText(text: 'Notifications', fontSize: 16.sp),
              onTap: () {
                // Get.to(NotificationsView()); // Navigate to Notifications View
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: AppColors.primary),
              title: PHAText(text: 'Logout', fontSize: 16.sp),
              onTap: () async {
                      // Show the custom loader
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const PHALoader();
                        },
                      );

                      Storage.clear();
                      Get.offAll(GetStartView());
                    },
            ),
          ],
        ),
      ),
    );
  }
}
