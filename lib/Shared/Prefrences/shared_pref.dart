// import 'package:shared_preferences/shared_preferences.dart';

// class AuthPreferences {
//   static const String hasSeenGetStartedKey = 'hasSeenGetStarted';
//   static const String isLoggedInKey = 'isLoggedIn';

//   // Save 'Get Started' screen preference
//   static Future<void> setHasSeenGetStarted(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(hasSeenGetStartedKey, value);
//   }

//   // Get 'Get Started' screen preference
//   static Future<bool> getHasSeenGetStarted() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(hasSeenGetStartedKey) ?? false; // default to false
//   }
  
//   // Save login state preference
//   static Future<void> setIsLoggedIn(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool(isLoggedInKey, value);
//   }

//   // Get login state preference
//   static Future<bool> getIsLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(isLoggedInKey) ?? false; // default to false
//   }
// }
