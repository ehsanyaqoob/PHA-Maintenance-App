import 'package:pharesidence/exports/exports.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with logo and close button
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and App Title
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'), // Logo
                        radius: 30,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PHA FOUNDATION',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'RESIDENCIA',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Close Button
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Drawer Menu Items with improved spacing and layout
            buildDrawerItem(
              icon: Icons.star_border,
              text: 'Rate Us',
              onTap: () {
                // Handle navigation
              },
            ),
            buildDrawerItem(
              icon: Icons.privacy_tip_outlined,
              text: 'Privacy Policy',
              onTap: () {
                // Handle navigation
              },
            ),
            buildDrawerItem(
              icon: Icons.article_outlined,
              text: 'Terms & Conditions',
              onTap: () {
                // Handle navigation
              },
            ),
            buildDrawerItem(
              icon: Icons.notifications_none,
              text: 'Notifications',
              badgeCount: 2, // Notification count
              onTap: () {
                // Handle navigation
              },
            ),
            buildDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                // Handle logout logic
              },
            ),
            Spacer(),
            // Footer (optional, like app version or copyright)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create drawer items
  Widget buildDrawerItem({
    required IconData icon,
    required String text,
    int badgeCount = 0,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Stack(
        children: [
          Icon(icon, color: Colors.black, size: 28),
          if (badgeCount > 0)
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Text(
                  '$badgeCount',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
