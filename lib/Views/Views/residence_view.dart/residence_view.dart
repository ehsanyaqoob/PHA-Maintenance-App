import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/bottm_sheet.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

// class ResidenceView extends StatefulWidget {
//   const ResidenceView({Key? key}) : super(key: key);
//
//   @override
//   State<ResidenceView> createState() => _ResidenceViewState();
// }
//
// class _ResidenceViewState extends State<ResidenceView> {
//   void _showResidenceBottomSheet() {
//     showCustomBottomSheet(
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 100.w,
//             height: 5.h,
//             margin: const EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               color: AppColors.primary,
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.apartment,
//             size: 26,
//              color: Colors.blue),
//             title: PHAText(
//               text: 'Apartments',
//               fontSize: 18,
//
//             ),
//             onTap: () {
//               Get.back();
//
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.business,size: 26, color: Colors.green),
//             title: PHAText(
//               text: 'Commercials',
//               fontSize: 18,
//
//             ),
//             onTap: () {
//               Get.back();
//               // Add action for Commercials selection
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.construction,size: 26, color: Colors.orange),
//             title: PHAText(
//               text: 'Grey Structure',
//               fontSize: 18,
//
//             ),
//             onTap: () {
//               Get.back();
//               // Add action for Grey Structure selection
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: CustomAppBar(
//         title: 'Residence',
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 26.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PHAText(
//               textAlign: TextAlign.center,
//               text: 'Select Your Property\nAppartment/Commercials/Grey Structures',
//             fontSize: 18.sp,
//             ),
//             SizedBox(height: 30.h,),
//             Center(
//               child: PHAButton(
//
//                 onTap: _showResidenceBottomSheet, title: 'Select Property',
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
