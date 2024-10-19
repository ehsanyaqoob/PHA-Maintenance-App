import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
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
            leading: Icon(Icons.star, color: AppColors.AppPrimary, size: 30,),
            title: PHAText(text: 'Rate Us', fontSize: 16.sp, ),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: AppColors.AppPrimary,size: 30,),
            title: PHAText(text: 'Privacy Policy', fontSize: 16.sp),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: Icon(Icons.article, color: AppColors.AppPrimary,size: 30,),
            title: PHAText(text: 'Terms & Conditions', fontSize: 16.sp),
            onTap: () {
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: Stack(
              children: [
                Icon(Icons.notifications, color: AppColors.AppPrimary,size: 30,),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius:8,
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
              // Handle navigation or action
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout, color: AppColors.AppPrimary),
            title: PHAText(text: 'Logout', fontSize: 16.sp),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
