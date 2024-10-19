
// import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
// import 'package:pharesidence/exports/exports.dart';
// class ProfileSecView extends StatefulWidget {
//   @override
//   _ProfileSecViewState createState() => _ProfileSecViewState();
// }

// class _ProfileSecViewState extends State<ProfileSecView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Edit Profile',
//         centerTitle: false,
//       ),
//       backgroundColor: AppColors.AppSecondary,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 24.0),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 80,
//                 backgroundColor: AppColors.AppPrimary,
//               ),
//               SizedBox(height: 20),

//               // Full Name Field
//               PHATextFormField(
//                 hint: 'Full Name',
//                 prefix: Icon(
//                   Icons.person_outline,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Nickname Field
//               PHATextFormField(
//                 hint: 'Nickname',
//                 //controller: nicknameController,
//                 prefix: Icon(
//                   Icons.person,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Date of Birth Field
//               PHATextFormField(
//                 hint: 'Date of Birth',
//                 //  controller: dobController,
//                 suffix: Icon(
//                   Icons.calendar_today,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),

//                 isObscure: false, // Date of birth should not be obscured
//               ),
//               SizedBox(height: 20),

//               // Email Field
//               PHATextFormField(
//                 inputType: TextInputType.emailAddress,
//                 hint: 'Email',
//                 //controller: emailController,
//                 suffix: Icon(
//                   Icons.email,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Phone Number Field

//               PHATextFormField(
//                 inputType: TextInputType.phone,
//                 hint: 'Phone Number',
//                 //controller: phoneController,
//                 suffix: Icon(
//                   Icons.flag,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Address Field
//               PHATextFormField(
//                 inputType: TextInputType.text,
//                 hint: 'Address',
//                 //controller: addressController,
//                 suffix: Icon(
//                   Icons.location_on,
//                   size: 24,
//                   color: AppColors.appWhite,
//                 ),
//               ),
//               SizedBox(height: 30),
//               // SizedBox(height: 20),
//               PHAButton(
//                 title: 'Continue',
//                 onTap: () {
//                   //Navigate to LoginView
//                   // Get.to(CreatePinView());
//                 },
//                 topMargin: 30.0,
//                 fillColor: true,
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
