
// import 'package:pharesidence/Api_Providers/project_views.dart';
// import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
// import 'package:pharesidence/exports/exports.dart';


// class ProjectDetailView extends StatelessWidget {
//   final Project project;

//   const ProjectDetailView({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: project.name,
//         centerTitle: false,
//       ),
//       backgroundColor: AppColors.AppSecondary,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Project status with colored tag
//             _buildStatusTag(project.status),
//             SizedBox(height: 20.h),

//             // Project name
//             PHAText(
//               text: project.name,
//               fontSize: 22.sp,
//               fontWeight: FontWeight.bold,
//               color: AppColors.AppPrimary,
//             ),
//             SizedBox(height: 10.h),

//             // Description
//             PHAText(
//               text: project.description,
//               fontSize: 16.sp,
//               color: Colors.grey.shade600,
//             ),

//             SizedBox(height: 20.h),

//             // Additional info section
//             _buildAdditionalInfoSection(),

//             SizedBox(height: 40.h),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAdditionalInfoSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PHAText(
//           text: 'Additional Info',
//           fontSize: 18.sp,
//           fontWeight: FontWeight.bold,
//           color: AppColors.AppPrimary,
//         ),
//         SizedBox(height: 10.h),
//         DataTable(
//           columns: const [
//             DataColumn(label: Text('Field', style: TextStyle(fontWeight: FontWeight.bold))),
//             DataColumn(label: Text('Details', style: TextStyle(fontWeight: FontWeight.bold))),
//           ],
//           rows: [
//             DataRow(cells: [
//               DataCell(Text('Project Name')),
//               DataCell(Text("PHA-F Officer's Residencia, Kurri Road")),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Project Type')),
//               DataCell(Text('Residencia')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Category Type')),
//               DataCell(Text('Cat-I')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Total Apartments')),
//               DataCell(Text('117')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Total Blocks')),
//               DataCell(Text('1')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Has Shops')),
//               DataCell(Text('No')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Completion Period')),
//               DataCell(Text('2018')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Designed By')),
//               DataCell(Text('M/s Progressive Pvt. Ltd.')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Supervision By')),
//               DataCell(Text('M/s EMS Private Limited')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Contractor By')),
//               DataCell(Text('M/s Malik Constructions, M/s Sardar Waheed, M/s KB Constructions, M/s Ali Associates')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Covered Area')),
//               DataCell(Text('4700 sq. ft.')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Down Payment (%)')),
//               DataCell(Text('15%')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Total Installments')),
//               DataCell(Text('2')),
//             ]),
//             DataRow(cells: [
//               DataCell(Text('Installment Type')),
//               DataCell(Text('Quarterly')),
//             ]),
//           ],
//         ),
//       ],
//     );
//   }
// }
// Widget _buildStatusTag(String status) {
//     Color statusColor;

//     // Assign different colors based on project status
//     switch (status) {
//       case 'Ongoing':
//         statusColor = Colors.blue;
//         break;
//       case 'Upcoming':
//         statusColor = Colors.orange;
//         break;
//       case 'Completed':
//         statusColor = Colors.green;
//         break;
//       case 'Cancelled':
//         statusColor = Colors.red;
//         break;
//       default:
//         statusColor = Colors.grey;
//     }

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
//       decoration: BoxDecoration(
//         color: statusColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: PHAText(
//         text: status,
//         fontSize: 14.sp,
//         color: statusColor,
//         fontWeight: FontWeight.w600,
//       ),
//     );
//   }

//   Widget _buildAdditionalInfoSection() {
//     // Placeholder for additional project details (e.g., deadlines, budget, or team)
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PHAText(
//           text: 'Additional Info',
//           fontSize: 18.sp,
//           fontWeight: FontWeight.bold,
//           color: AppColors.AppPrimary,
//         ),
//         SizedBox(height: 10.h),
//         PHAText(
//           text: '• Start Date: June 1, 2024\n• Budget: 500,000\n• Assigned Team: XYZ',
//           fontSize: 16.sp,
//           color: Colors.grey.shade600,
//         ),
//       ],
//     );
//   }
  