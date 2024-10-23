import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

import '../../drawer/notifications.dart';
import '../../drawer/privacy_policy.dart';
import '../../drawer/rateus.dart';
import '../../drawer/terms_conditions.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.AppSecondary,
            ),
            child: Row(
              children: [
                Image.asset('assets/png/logo.png', width: 60, height: 60),
                SizedBox(width: 10),
                PHAText(
                  text: 'PHAF MAINTENANCE\nSERVICES',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.AppPrimary,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.star, color: AppColors.AppPrimary, size: 30),
            title: PHAText(text: 'Rate Us', fontSize: 16.sp),
            onTap: () {
             // Get.to(RateUsView()); // Navigate to Rate Us View
            },
          ),
          ListTile(
            leading:
                Icon(Icons.privacy_tip, color: AppColors.AppPrimary, size: 30),
            title: PHAText(text: 'Privacy Policy', fontSize: 16.sp),
            onTap: () {
              Get.to(PrivacyPolicyView()); // Navigate to Privacy Policy View
            },
          ),
          ListTile(
            leading: Icon(Icons.article, color: AppColors.AppPrimary, size: 30),
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
                    color: AppColors.AppPrimary, size: 30),
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
              Get.to(NotificationsView()); // Navigate to Notifications View
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.AppPrimary),
            title: PHAText(text: 'Logout', fontSize: 16.sp),
            onTap: () {
              // Get.to(LogoutView()); // Navigate to Logout View
            },
          ),
        ],
      ),
    );
  }
}
