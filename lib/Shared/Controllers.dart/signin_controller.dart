import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharesidence/Api_Providers/Api_Responses/api_urls.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/home_view.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SigninController extends GetxController {
  var cnic = ''.obs;
  var cell = ''.obs; // Change phone to cell
  var isLoading = false.obs;

  void onCNICChange(String value) {
    cnic.value = value;
  }

  void onCellChange(String value) {
    cell.value = value;
  }

  Future<void> signInUser() async {
    if (cnic.value.isEmpty || cell.value.isEmpty) {
      Get.snackbar('Error', 'CNIC and cell number cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      // Updated request body
      final Map<String, dynamic> requestBody = {
        "cnic": cnic.value.trim().replaceAll('-', ''),
        "cell": cell.value.trim().replaceAll('-', ''),
      };

      debugPrint("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['status'] == true) {
          debugPrint("Token: ${responseData['data']['token']}");
             // Save login state to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true); // Save user login session

          // Save API data to SharedPreferences
          await prefs.setString('apiData', jsonEncode(responseData['data'])); // Save entire data

          // Navigating to HomeView and passing the entire data dynamically
          Get.to(() => HomeView(apiData: responseData['data']));

          debugPrint("Navigation call executed.");
        } else {
          Get.snackbar(
              'Error', responseData['message'] ?? 'Invalid credentials');
        }
      } else {
        // Log full response for debugging
        debugPrint("Response: ${response.body}");
        Get.snackbar('Error', 'Login failed: ${response.body}');
      }
    } catch (e) {
      debugPrint("Exception: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
