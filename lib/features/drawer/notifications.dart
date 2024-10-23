import 'package:pharesidence/exports/exports.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title:'Notifications',
        backgroundColor: AppColors.AppSecondary,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 5, // Example of 5 notifications
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: Text('Notification ${index + 1}'),
              subtitle: Text('This is the description of notification ${index + 1}.'),
              onTap: () {
                // Handle notification click
              },
            ),
          );
        },
      ),
    );
  }
}
