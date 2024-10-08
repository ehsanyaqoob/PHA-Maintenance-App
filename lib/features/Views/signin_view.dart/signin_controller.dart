import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharesidence/Api_Providers/Api_Responses/api_urls.dart';
import 'package:pharesidence/features/Views/Home/home_view.dart';
import 'dart:convert';

class SinginController extends GetxController {
  var cnic = ''.obs;
  var phone = ''.obs;
  var isLoading = false.obs;

  void onCNICChange(String value) {
    cnic.value = value;
  }

  void onPhoneChange(String value) {
    phone.value = value;
  }
Future<void> signInUser() async {
  if (cnic.value.isEmpty || phone.value.isEmpty) {
    Get.snackbar('Error', 'CNIC and phone number cannot be empty');
    return;
  }

  isLoading.value = true;

  try {
    final Map<String, dynamic> requestBody = {
      "cnic": cnic.value,
      "phone": phone.value,
    };

    final response = await http.post(
      Uri.parse(loginUrl),  
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['token'] != null) {

        // Print the token to the console
        print("Token: ${responseData['token']}");
        // Navigate to OtpViewsign
        Get.to(() => HomeView(cnic: cnic.value, phone: phone.value));
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } else {
      Get.snackbar('Error', 'Login failed: ${response.body}');
    }
  } catch (e) {
    Get.snackbar('Error', 'An error occurred: $e');
  } finally {
    isLoading.value = false;
  }
}
}