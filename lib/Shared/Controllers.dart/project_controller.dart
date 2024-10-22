import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharesidence/models/additionalInfo_model.dart';
import 'dart:convert';
import '../../Api_Providers/Api_Responses/api_urls.dart';
import '../../exports/exports.dart';
import '../../models/projects_models.dart';

class ProjectsViewController extends GetxController {
  var isLoading = true.obs;
  var projects = <MembershipData>[].obs;

  Future<void> fetchProjects(String cnic) async {
    if (cnic.isEmpty) {
      Get.snackbar('Error', 'CNIC cannot be empty');
      return;
    }
    try {
      final Map<String, dynamic> requestBody = {"cnic": cnic.trim()};
      final response = await http.post(
        Uri.parse(GetCNICByMembership),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        var model = MembershipModel.fromJson(data);
        if (model.status == true) {
         //Handle there business logic
          print(model.data);
        } else {
          Get.snackbar('Error', model.message ?? 'Invalid credentials');
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



  Future<void> fetchAdditionalInfo(String cnic) async {
    try {
      final Map<String, dynamic> requestBody = {"cnic": cnic.trim()};
      final response = await http.post(
        Uri.parse(getAdditionalInfoByCNIC),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        var model = AdditionalInfoModel.fromJson(data);
        if (model.status == true) {
          //Handle there business logic
        } else {
          Get.snackbar('Error', model.message ?? 'Invalid credentials');
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

  Future<void> getPSID(String cnic) async {
    try {
      final Map<String, dynamic> requestBody = {
        "consumerno": "12345",
        "full_name": "John Doe",
        "cnic": "1234567890123",
        "challanId": "12345",
        "due_date": "2024-12-31",
        "iss_date": "2024-12-01",
        "due_amount": 1700,
        "adue_amount": 1700,
        "reserved": "PHA_Maintenance"
      };
      final response = await http.post(
        Uri.parse(getAdditionalInfoByCNIC),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data['status'] == true) {
          //Handle there business logic
        } else {
          Get.snackbar('Error', data['message'] ?? 'Invalid credentials');
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
