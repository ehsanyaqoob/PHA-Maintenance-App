import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

// class ProfileSecView extends StatefulWidget {
//   @override
//   _ProfileSecViewState createState() => _ProfileSecViewState();
// }
//
// class _ProfileSecViewState extends State<ProfileSecView> {
//   bool isEditable = true; // Toggle between edit and view mode
//
//   // Controllers for each input field
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController nicknameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers when not needed to avoid memory leaks
//     fullNameController.dispose();
//     nicknameController.dispose();
//     dobController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     addressController.dispose();
//     super.dispose();
//   }
//
//   void _showSnackbar(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Details saved successfully!"),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Edit Profile',
//         centerTitle: false,
//         actions: [
//           IconButton(
//             icon: Icon(isEditable ? Icons.edit_off : Icons.edit),
//             onPressed: () {
//               setState(() {
//                 isEditable = !isEditable; // Toggle edit mode
//               });
//             },
//           ),
//         ],
//       ),
//       backgroundColor: AppColors.secondary,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               PHAText(
//                 text: 'Personal Information',
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primary,
//               ),
//               SizedBox(height: 20),
//
//               // Full Name Field
//               PHATextFormField(
//                 controller: fullNameController,
//                 hint: 'Full Name',
//                 prefix: Icon(
//                   Icons.person_outline,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 20),
//
//               // Nickname Field
//               PHATextFormField(
//                 controller: nicknameController,
//                 hint: 'Nickname',
//                 prefix: Icon(
//                   Icons.person,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 20),
//
//               // Date of Birth Field
//               PHATextFormField(
//                 controller: dobController,
//                 hint: 'Date of Birth',
//                 suffix: Icon(
//                   Icons.calendar_today,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 isObscure: false,
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 20),
//
//               // Email Field
//               PHATextFormField(
//                 controller: emailController,
//                 inputType: TextInputType.emailAddress,
//                 hint: 'Email',
//                 suffix: Icon(
//                   Icons.email,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 20),
//
//               // Phone Number Field
//               PHATextFormField(
//                 controller: phoneController,
//                 inputType: TextInputType.phone,
//                 hint: 'Phone Number',
//                 suffix: Icon(
//                   Icons.phone,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 20),
//
//               // Address Field
//               PHATextFormField(
//                 controller: addressController,
//                 inputType: TextInputType.text,
//                 hint: 'Address',
//                 suffix: Icon(
//                   Icons.location_on,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//                 enabled: isEditable,
//               ),
//               SizedBox(height: 30),
//
//               Center(
//                 child: PHAButton(
//                   title: 'Save',
//                   onTap: () {
//                     // Save data logic goes here
//                     setState(() {
//                       isEditable = false; // Lock fields after saving
//                     });
//                     _showSnackbar(context); // Show snackbar
//                   },
//                   topMargin: 30.0,
//                   fillColor: true,
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
