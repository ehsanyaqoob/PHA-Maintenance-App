import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Shared/Prefrences/shared_pref.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';

import '../../drawer/notifications.dart';
import '../../drawer/privacy_policy.dart';
import '../../drawer/rateus.dart';
import '../../drawer/terms_conditions.dart';

class CustomDrawer extends StatelessWidget {
    final AuthService _authService = AuthService();

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
             
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () async {
                      // Show the custom loader
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const PHALoader();
                        },
                      );

                      await Future.delayed(Duration(seconds: 2));
                      await _authService.logoutUser();

                      // Close the loader
                      Navigator.of(context).pop();

                      Get.offAll(() => GetStartView());
                    },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.AppSecondary,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.AppPrimary.withOpacity(0.85),
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PHAText(
                      text: 'logout',
                      fontSize: 16,
                    ),
                     Icon(
                        Icons.logout,
                        color: AppColors.AppPrimary,
                        size: 22,
                      ),
                     
                    
                  ],
                ),
              ),
            )
          );
            },
          ),
        ],
      ),
    );
  }
}
