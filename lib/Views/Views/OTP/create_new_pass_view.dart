
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

// class CreateNewPassView extends StatefulWidget {
//   const CreateNewPassView({super.key});
//
//   @override
//   State<CreateNewPassView> createState() => _CreateNewPassViewState();
// }
//
// class _CreateNewPassViewState extends State<CreateNewPassView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.secondary,
//       appBar: CustomAppBar(
//         title: 'Go Back',
//         onLeadingPressed: () {
//           Navigator.pop(context);
//         },
//         backgroundColor: AppColors.secondary,
//         elevation: 0,
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 80.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               PHAText(
//                 //textAlign: TextAlign.center,
//                 text: 'Create New password 🔑',
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               PHAText(
//                 //textAlign: TextAlign.center,
//                 text:
//                     'Please enter a new one and strong password that will be sucuring your account',
//                 fontSize: 16,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               // two textforfield for sign up
//               PHAText(text: 'New password', fontSize: 20),
//               PHATextFormField(
//                 controller: newPasswordController,
//                 hint: 'Password',
//                 isObscure: !isNewPasswordVisible,
//                 prefix: Icon(
//                   Icons.lock,
//                   color: AppColors.greycolor,
//                   size: 25,
//                 ),
//                 suffix: IconButton(
//                   icon: Icon(
//                     isNewPasswordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                     color: AppColors.greycolor,
//                     size: 25,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isNewPasswordVisible = !isNewPasswordVisible;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               PHAText(text: 'Conform new password', fontSize: 20),
//
//               PHATextFormField(
//                 controller: confirmNewPasswordController,
//                 hint: 'Password',
//                 isObscure: !isConfirmPasswordVisible,
//                 prefix: Icon(
//                   Icons.lock,
//                   color: AppColors.greycolor,
//                   size: 25,
//                 ),
//                 suffix: IconButton(
//                   icon: Icon(
//                     isConfirmPasswordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                     color: AppColors.greycolor,
//                     size: 25,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isConfirmPasswordVisible = !isConfirmPasswordVisible;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//
//               PHAButton(
//                 title: 'Continue',
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     barrierDismissible: true,
//                     builder: (BuildContext context) {
//                       return CustomSuccessLockDialog(
//                         message: 'New Password Created Successfully 🎉',
//                         onClose: () {
//                           Navigator.of(context)
//                               .pop(); // Close the dialog when done
//                         },
//                       );
//                     },
//                   );
//                 },
//                 topMargin: 30.0,
//                 fillColor: true,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
