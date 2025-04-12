import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/payment_status.dart';
import 'package:pharesidence/Views/getStartedView.dart';
import '../../drawer/rateus.dart';


class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DrawerHeader(
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(
            //         AppAssets.appLogo,
            //         width: 60.w,
            //         height: 60.h,
            //       ),
            //       SizedBox(width: 8),
            //       PHAText(
            //         text: 'PHAF MAINTENANCE \n SERVICES',
            //         fontSize: 16.sp,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.blackGray,
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 250,
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.appLogo,
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(height: 8),
                  PHAText(
                    text: 'PHA Maintenance App',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackGray,
                  ),
                  Spacer(),
                  Divider()
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.star, size: 30),
              title: PHAText(text: 'Payment Status', fontSize: 16.sp),
              onTap: () {
               Get.to(PaymentVerification()); // Navigate to Rate Us View
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.privacy_tip, size: 30),
              title: PHAText(text: 'Privacy Policy', fontSize: 16.sp),
              onTap: () async {
                final _url = Uri.parse(
                    'https://pha.gov.pk/downloads/Privacy%20Policy%20for%20Pakistan%20Housing%20Authority%20Foundation%20(PHA)%20App.pdf');
                try {
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                } catch (e) {
                  Get.snackbar('Error', 'An error occurred: ${e.toString()}');
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.article, size: 30),
              title: PHAText(text: 'Terms & Conditions', fontSize: 16.sp),
              onTap: () async {
                final _url = Uri.parse(
                    'https://pha.gov.pk/GenericFront.aspx?pageid=5&type=pdf');
                try {
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                } catch (e) {
                  Get.snackbar('Error', 'An error occurred: ${e.toString()}');
                }
              },
            ),
            ListTile(
              leading: Stack(
                children: [
                  Icon(Icons.notifications, size: 30),
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
              leading: Icon(Icons.logout),
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
