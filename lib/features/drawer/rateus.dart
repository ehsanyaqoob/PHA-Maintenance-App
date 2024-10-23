// import 'package:flutter/material.dart';
// import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
// import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
// import 'package:pharesidence/exports/exports.dart';
// import 'package:url_launcher/url_launcher.dart';


// class RateUsView extends StatefulWidget {
//   @override
//   _RateUsViewState createState() => _RateUsViewState();
// }

// class _RateUsViewState extends State<RateUsView> {
//   double _rating = 3.0; // Default rating

//   // Define the payment API URL as a String
//   final String paymentApiUrl = "http://20.46.49.230/api/initiate-payment"; // Test API URL

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.AppSecondary,
//       appBar: CustomAppBar(
//         title: 'Rate Us',
//         backgroundColor: AppColors.AppSecondary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PHAText(
//               text: 'How was your experience?',
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(5, (index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _rating = index + 1.0;
//                     });
//                   },
//                   child: Icon(
//                     Icons.star,
//                     color: index < _rating ? Colors.amber : Colors.grey,
//                     size: 40,
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(height: 20),
//             PHAButton(
//               title: 'Rate Now',
//               fillColor: true,
//               onTap: () {
//                 // Show the loader for 3 seconds, then attempt to open the payment URL
//                 showDialog(
//                   context: context,
//                   barrierDismissible: false,
//                   builder: (BuildContext context) {
//                     return const PHALoader();
//                   },
//                 );

//                 // After 3 seconds, launch the payment URL in the browser
//                 Future.delayed(Duration(seconds: 3), () {
//                   Navigator.pop(context); // Close the loader
//                   _launchPaymentUrl(paymentApiUrl); // Attempt to open the URL
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to launch the payment URL in the browser
//   Future<void> _launchPaymentUrl(String url) async {
//     final Uri uri = Uri.parse(url); // Parse the String URL into Uri

//     try {
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication); // Opens the URL in the browser
//       } else {
//         _showErrorDialog("Could not open the payment page. Please try again.");
//       }
//     } catch (e) {
//       _showErrorDialog("Error occurred: $e");
//     }
//   }

//   // Show an error dialog if URL launch fails
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
