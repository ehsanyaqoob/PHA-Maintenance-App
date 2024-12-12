import 'package:pharesidence/Utils/exports/exports.dart';

// class ComplaintView extends StatefulWidget {
//   const ComplaintView({super.key});
//
//   @override
//   State<ComplaintView> createState() => _ComplaintViewState();
// }
//
// class _ComplaintViewState extends State<ComplaintView> {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   String? _priorityLevel = 'Low';
//   final List<String> priorityLevels = ['Low', 'Medium', 'High'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: AppBar(
//         title: Text(
//           'File a Complaint',
//           style: TextStyle(
//             color: AppColors.appBlack,
//             fontSize: 18.sp,
//             fontFamily: AppFonts.poppins,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: AppColors.appBlack),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20),
//             // Header
//             Center(
//               child: Text(
//                 'Tell us what’s wrong',
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontFamily: AppFonts.poppins,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.appBlack.withOpacity(0.7),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//
//             // Complaint Title Card
//             _buildCard(
//               child: TextField(
//                 controller: _titleController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Complaint Title',
//                   hintStyle: TextStyle(
//                     color: AppColors.appBlack.withOpacity(0.6),
//                     fontSize: 14.sp,
//                     fontFamily: AppFonts.poppins,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//               icon: Icons.title,
//               title: 'Complaint Title',
//             ),
//             SizedBox(height: 20),
//
//             // Description Card
//             _buildCard(
//               child: TextField(
//                 controller: _descriptionController,
//                 maxLines: 5,
//                 decoration: InputDecoration(
//                   hintText: 'Describe the issue...',
//                   hintStyle: TextStyle(
//                     color: AppColors.appBlack.withOpacity(0.6),
//                     fontSize: 14.sp,
//                     fontFamily: AppFonts.poppins,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//               icon: Icons.description,
//               title: 'Description',
//             ),
//             SizedBox(height: 20),
//
//             // Priority Level Card
//             _buildCard(
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: _priorityLevel,
//                   items: priorityLevels.map((level) {
//                     return DropdownMenuItem<String>(
//                       value: level,
//                       child: Text(
//                         level,
//                         style: TextStyle(
//                           color: AppColors.appBlack,
//                           fontFamily: AppFonts.poppins,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _priorityLevel = value;
//                     });
//                   },
//                 ),
//               ),
//               icon: Icons.priority_high,
//               title: 'Priority Level',
//             ),
//             SizedBox(height: 20),
//
//             // Attach Image Button
//             Center(
//               child: PHAButton(
//                 fillColor: true,
//                 title: 'Attach image',
//                 onTap: () {
//                   // Add image picker functionality here
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
//
//             // Submit Button
//             Center(
//               child: PHAButton(
//                 fillColor: true,
//                 title: 'Submit Complain',
//                 onTap: () {
//                   // Add image picker functionality here
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Custom Card Widget
//   Widget _buildCard(
//       {required Widget child, required IconData icon, required String title}) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.appWhite,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: AppColors.primary),
//               SizedBox(width: 8),
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: AppColors.appBlack,
//                   fontSize: 14.sp,
//                   fontFamily: AppFonts.poppins,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           child,
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
// }
