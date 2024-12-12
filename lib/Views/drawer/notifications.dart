import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';

import '../../Generic_Widgets/Widgets/custom_loarder.dart';

// class NotificationsController extends GetxController {
//   var notifications = <String>[].obs;  // Observable list of notifications
//   var isLoading = true.obs;  // Loading state
//
//   // Simulating server push notifications with Stream
//   Stream<List<String>> getNotificationsStream() async* {
//     while (true) {
//       await Future.delayed(Duration(seconds: 2));  // Simulating server-side updates
//       notifications.add('New notification at ${DateTime.now()}');
//       yield notifications;
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Add initial dummy notifications
//     notifications.addAll([
//       'Welcome to Notifications!',
//       'Your profile was updated successfully.',
//       'New event available in your area.',
//     ]);
//
//     // Set loading state to false after 2 seconds
//     Future.delayed(Duration(seconds: 2), () {
//       isLoading.value = false;
//     });
//
//     getNotificationsStream();  // Start listening for notifications
//   }
// }
//
// class NotificationsView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final NotificationsController controller = Get.put(NotificationsController());
//
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: CustomAppBar(
//         title: 'Notifications',
//         backgroundColor: AppColors.secondary,
//         elevation: 0,
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           // Simulate refresh by adding a delay (e.g., you can call your API here)
//           await Future.delayed(Duration(seconds: 2));
//         },
//         child: Obx(
//           () {
//             // Display loader if still loading
//             if (controller.isLoading.value) {
//               return Center(child: PHALoader());
//             }
//
//             // Show notifications list after loading is complete
//             if (controller.notifications.isEmpty) {
//               return Center(child: Text("No notifications available."));
//             } else {
//               return ListView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//                 itemCount: controller.notifications.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: EdgeInsets.only(bottom: 16),
//                     elevation: 8,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     color: AppColors.appWhite,
//                     child: ListTile(
//                       contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//                       leading: CircleAvatar(
//                         radius: 25,
//                         backgroundColor: AppColors.primary.withOpacity(0.1),
//                         child: Icon(
//                           Icons.house,
//                           color: AppColors.primary,
//                           size: 28,
//                         ),
//                       ),
//                       title: PHAText(
//                         text: controller.notifications[index],
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary,
//                       ),
//                       subtitle: PHAText(
//                         text: 'This is the description of ${controller.notifications[index]}.',
//                         fontSize: 16,
//                         color: AppColors.primary.withOpacity(0.7),
//                       ),
//                       trailing: Icon(
//                         Icons.arrow_forward_ios,
//                         color: AppColors.primary.withOpacity(0.6),
//                         size: 20,
//                       ),
//                       onTap: () {},
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
