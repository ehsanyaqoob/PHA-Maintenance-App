import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isNotificationEnabled = true;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Settings',
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.appBlack),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            // Account Section
            PHAText(
              text: 'Account',
              color: AppColors.appBlack,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            _buildSettingsTile(
              icon: Icons.person_outline,
              title: 'Profile',
              onTap: () {
                // Navigate to Profile
              },
            ),
            _buildSettingsTile(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                // Navigate to Change Password
              },
            ),
            Divider(height: 40, color: AppColors.greycolor),
            // Preferences Section
            PHAText(
              text: 'Preferences',
             
                color: AppColors.appBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              
            ),
            SizedBox(height: 8),
            _buildSwitchTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              value: isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildSwitchTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              value: isDarkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
            Divider(height: 40, color: AppColors.greycolor),
            // More Options
            PHAText(
             text:  'More',
             
                color: AppColors.appBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              
            ),
            SizedBox(height: 8),
            _buildSettingsTile(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {
                // Navigate to About
              },
            ),
            _buildSettingsTile(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Handle Logout
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build each setting item with icon and text
  Widget _buildSettingsTile(
      {required IconData icon, required String title, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.AppPrimary),
      title: PHAText(
       
   text:title ,    
          color: AppColors.appBlack,
          fontSize: 14.sp,
        ),
      
      trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: onTap,
    );
  }

  // Helper method to build each toggle setting
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.AppPrimary),
      title: PHAText(
      text:   title,
      
          color: AppColors.appBlack,
          fontSize: 14.sp,
        
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.AppPrimary,
      ),
    );
  }
}
