
import 'package:pharesidence/exports/exports.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
          color:    AppColors.CardColor,
            ),
            child: Text(
              'PHAF MAINTENANCE SERVICES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.star_border),
            title: Text('Rate Us'),
            onTap: () {
              // Handle rate us action
              Navigator.pop(context); // Close the drawer after the action
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () {
              // Handle privacy policy action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text('Terms & Conditions'),
            onTap: () {
              // Handle terms & conditions action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            trailing: Badge(
             // badgeContent: Text('2'),
              child: Icon(Icons.notifications_active),
            ),
            onTap: () {
              // Handle notifications action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
