import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';

import '../../Api_Providers/Api_Responses/api_urls.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var rememberMe = false.obs;

  // Controllers for form fields
  final nameController = TextEditingController();
  final cnicController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to toggle "Remember me" checkbox
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // API function to sign up the user
  Future<void> signUpUser() async {
    isLoading.value = true;

    try {
      // Prepare the request body
      final Map<String, dynamic> requestBody = {
        "name": nameController.text.trim(),
        "cnic": cnicController.text.trim(),
        "phone": phoneNumberController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      // Send a POST request to the sign-up API endpoint
      final response = await http.post(
        Uri.parse(SignUpUrl), 
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          // User signed up successfully, handle success response here
          print('Sign-up successful! Token: ${responseData['token']}');

          // Navigate to another view (e.g., OtpView or home screen)
          // Get.to(OtpView()); 
          //or Get.off(HomeView());
        } else {
          // Handle the case where token is missing
          Get.snackbar('Error', 'Sign-up failed. Please try again.');
        }
      } else {
        // Handle server error or bad response
        Get.snackbar('Error', 'Sign-up failed: ${response.body}');
      }
    } catch (e) {
      // Handle network or API error
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
