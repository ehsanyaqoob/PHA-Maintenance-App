// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:pharesidence/features/Views/Home/homeView.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../features/Views/Splash_view/getStartedView.dart';
//
// class AuthPreferences {
//   static const String hasSeenGetStartedKey = 'hasSeenGetStarted';
//   static const String isLoggedInKey = 'isLoggedIn';
//
//   // Save 'Get Started' screen preference
//   static Future<void> setHasSeenGetStarted(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(hasSeenGetStartedKey, value);
//   }
//
//   // Get 'Get Started' screen preference
//   static Future<bool> getHasSeenGetStarted() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(hasSeenGetStartedKey) ?? false; // default to false
//   }
//
//   // Save login state preference
//   static Future<void> setIsLoggedIn(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(isLoggedInKey, value);
//   }
//
//   // Get login state preference
//   static Future<bool> getIsLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(isLoggedInKey) ?? false; // default to false
//   }
// }
//  // method to log out the user
// class AuthService {
//   // Call this method to log out the user
//   Future<void> logoutUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isLoggedIn', false); // Remove login session
//
//     // Navigate to GetStartView (login screen)
//     Get.offAll(() => GetStartView());
//   }
// }
//
// // class AuthService {
// //   // Call this method when the user logs in
// //   Future<void> loginUser() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // Set the user as logged in
// //     await prefs.setBool('isLoggedIn', true);
//
// //     // Navigate to HomeView after successful login
// //     //Get.off(HomeView(apiData: {},));
// //   }
//
// //   // Call this method when the user logs out
// //   Future<void> logoutUser() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     // Set the user as logged out
// //     await prefs.setBool('isLoggedIn', false);
//
// //     // Navigate to the GetStartView (login page) after logout
// //     //Get.off(GetStartView());
// //   }
// // }
