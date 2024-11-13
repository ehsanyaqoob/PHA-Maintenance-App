import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var notifications = <String>[].obs;  // Observable list of notifications

  // Simulating server push notifications with Stream
  Stream<List<String>> getNotificationsStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 5));  // Simulating server-side updates
      notifications.add('New notification at ${DateTime.now()}');
      yield notifications;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNotificationsStream();  // Start listening for notifications
  }
}

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationsController controller = Get.put(NotificationsController());

    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Notifications',
        backgroundColor: AppColors.AppSecondary,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Simulate refresh by adding a delay (e.g., you can call your API here)
          await Future.delayed(Duration(seconds: 2));
        },
        child: Obx(
          () {
            if (controller.notifications.isEmpty) {
              return Center(child: PHALoader());  // Show loader until notifications are loaded
            } else {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: AppColors.appWhite,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.AppPrimary.withOpacity(0.1),
                        child: Icon(
                          Icons.house,
                          color: AppColors.AppPrimary,
                          size: 28,
                        ),
                      ),
                      title: PHAText(
                        text: controller.notifications[index],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.AppPrimary,
                      ),
                      subtitle: PHAText(
                        text: 'This is the description of ${controller.notifications[index]}.',
                        fontSize: 16,
                        color: AppColors.AppPrimary.withOpacity(0.7),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.AppPrimary.withOpacity(0.6),
                        size: 20,
                      ),
                      onTap: () {},
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
