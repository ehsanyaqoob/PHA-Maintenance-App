// import 'dart:io';
// import 'package:pha/Exports/exports.dart';
// import 'package:pha/Features/Profile_view/Edit_Profile/profile_sec_view.dart';
// import 'package:pha/Generic_Widgets/Widgets/bottm_sheet.dart';
// import 'package:pha/Generic_Widgets/Widgets/pha_text.dart';
// import 'package:pha/Modules/Profile_Modules/complaint_view.dart';
// import 'package:pha/Modules/Profile_Modules/dashboard_view.dart';
// import 'package:pha/Modules/Profile_Modules/payee_management.dart';
// import 'package:pha/Modules/Profile_Modules/settings_view.dart';

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.AppSecondary,
//       appBar: CustomAppBar(
//         onLeadingPressed: () {
//           Get.back();
//         },
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 35,
//               width: 100,
//               decoration: BoxDecoration(
//                 color: AppColors.AppSecondary,
//                 borderRadius: BorderRadius.circular(40),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.AppPrimary.withOpacity(0.85),
//                     offset: Offset(0, 0),
//                     blurRadius: 2,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   PHAText(
//                     text: 'logout',
//                     fontSize: 16,
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       Icons.logout,
//                       color: AppColors.appWhite,
//                       size: 22,
//                     ),
//                     onPressed: () async {
//                       // // signout logic
//                       // await authController.signOut();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 26.0,
//             vertical: 26.0,
//           ),
//           child: Column(
//             children: [
//               // SizedBox(
//               //   height: 20.h,
//               // ),
//               Container(
//                 height: 200.h,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: AppColors.AppPrimary,
//                   borderRadius: BorderRadius.circular(40),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.AppPrimary.withOpacity(
//                           0.85), // Shadow color
//                       offset: Offset(4, 4), // Shadow position (x, y)
//                       blurRadius: 0,
//                       spreadRadius: 0,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         showWhatsAppLikeBottomSheet(
//                           onCameraTap: controller.captureFromCamera,
//                           onGalleryTap: controller.pickFromGallery,
//                           onDeleteTap: controller.deleteAvatar,
//                           showDeleteOption:
//                               controller.avatarPath.value.isNotEmpty,
//                         );
//                       },
//                       child: Obx(
//                         () => CircleAvatar(
//                           radius: 40,
//                           backgroundImage:
//                               controller.avatarPath.value.isNotEmpty
//                                   ? FileImage(File(controller.avatarPath.value))
//                                   : AssetImage('assets/png/Ellipse.png')
//                                       as ImageProvider,
//                         ),
//                       ),
//                     ),
//                     PHAText(
//                       textAlign: TextAlign.center,
//                       text: 'ehsan lasharii',
//                       fontSize: 28,
//                     ),
//                     PHAText(
//                       textAlign: TextAlign.center,
//                       text: '312035792',
//                       fontSize: 20,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 50.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           CustomButtonWithIcon(
//                             text: 'Profile',
//                             icon: Icons.person,
//                             backgroundColor: AppColors.AppSecondary,
//                             textColor: AppColors.appWhite,
//                             iconColor: AppColors.AppPrimary,
//                             onTap: () {
//                               Get.to(ProfileSecView());
//                             },
//                           ),
//                           CustomButtonWithIcon(
//                             text: 'Settings',
//                             icon: Icons.settings,
//                             backgroundColor: AppColors.AppSecondary,
//                             textColor: AppColors.appWhite,
//                             iconColor: AppColors.AppPrimary,
//                             onTap: () {
//                               Get.to(SettingsView());
//                             },
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               Container(
//                 height: 130.h,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: AppColors.AppSecondary,
//                   borderRadius: BorderRadius.circular(40),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColors.AppPrimary.withOpacity(0.85),
//                       offset: Offset(0, 0),
//                       blurRadius: 2,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 36.0, vertical: 20.0),
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(DashboardView());
//                         },
//                         child: PHAButton(
//                           title: 'Dashboard',
//                           fillColor: false,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.to(ComplaintView());
//                         },
//                         child: PHAButton(
//                           //topMargin: 6.0,
//                           title: 'Complaint',
//                           fillColor: false,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                      // Get.to(AccountStatementView());
//                     },
//                     child: Container(
//                       height: 100.h,
//                       width: 150.w,
//                       decoration: BoxDecoration(
//                         color: AppColors.AppSecondary,
//                         borderRadius: BorderRadius.circular(40),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.AppPrimary.withOpacity(0.85),
//                             offset: Offset(0, 0),
//                             blurRadius: 2,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.bookmark_add_rounded,
//                               size: 40, color: AppColors.appWhite),
//                           PHAText(
//                             textAlign: TextAlign.center,
//                             text: 'Account\nStatement',
//                             fontSize: 22,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(PayeeManagementView());
//                     },
//                     child: Container(
//                       height: 100.h,
//                       width: 150.w,
//                       decoration: BoxDecoration(
//                         color: AppColors.AppSecondary,
//                         borderRadius: BorderRadius.circular(40),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.AppPrimary.withOpacity(0.85),
//                             offset: Offset(0, 0),
//                             blurRadius: 2,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.person_2_outlined,
//                               size: 40, color: AppColors.appWhite),
//                           PHAText(
//                             textAlign: TextAlign.center,
//                             text: 'Payee\nManagement',
//                             fontSize: 22,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               PHAText(
//                 text: 'PHA Digital Version 1.0.0 ',
//                 fontSize: 14,
//               ),
//               PHAText(
//                 text: 'Terms and Conditions ',
//                 color: AppColors.AppPrimary,
//                 fontSize: 14,
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
