import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pharesidence/models/additionalInfo_model.dart';
import 'dart:convert';
import '../../Api_Providers/Api_Responses/api_urls.dart';
import '../../exports/exports.dart';
import '../../features/Views/Home/Additional_inof_view/additional_info.dart';
import '../../models/projects_models.dart';

class ProjectsViewController extends GetxController {
// Inside your controller class

  var selectedPaymentOption = 'Pay full'.obs;
  var fullAmount = ''.obs;
  var partialAmount = ''.obs;
  TextEditingController fullAmountController = TextEditingController();
  TextEditingController partialAmountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Set the default payment option
    selectedPaymentOption.value = 'Pay full';
    // Set the full amount
    fullAmount.value = getFullAmount();
    fullAmountController.text =
        fullAmount.value; // Initialize the controller with the full amount
  }

  @override
  void onClose() {
    fullAmountController.dispose();
    partialAmountController.dispose();
    super.onClose();
  }

  String getFullAmount() {
    if (additionalInfoList.isNotEmpty) {
      return additionalInfoList.first.totalAmountDue.toString();
    }
    // by default TotalAmount is se
    // return additionalInfoList.first.totalAmountDue.toString();
    return '0';
  }

  void setPartialAmount(String value) {
    if (selectedPaymentOption.value == 'Pay Partial') {
      partialAmount.value = value;
      partialAmountController.text = value;
    }
  }

  void setPaymentOption(String value) {
    selectedPaymentOption.value = value;

    if (value == 'Pay full') {
      fullAmount.value = getFullAmount();
      fullAmountController.text = fullAmount.value;
      partialAmountController.clear();
    } else if (value == 'Pay Partial') {
      partialAmount.value = '';
      partialAmountController.clear();
    }
    update();
  }

  var isLoading = true.obs;
  var projects = <MembershipData>[].obs;

  Future<void> fetchProjects(String cnic) async {
    if (cnic.isEmpty) {
      Get.snackbar('Error', 'CNIC cannot be empty');
      return;
    }

    isLoading.value = true;

    try {
      final Map<String, dynamic> requestBody = {"cnic": cnic.trim()};

      // Debugging: Print request body
      debugPrint("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse(GetCNICByMembership),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      // Debugging: Print response status and body
      debugPrint("Response Status: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        var model = MembershipModel.fromJson(data);

        // Debugging: Print the parsed model data
        debugPrint("Parsed Model: $model");

        if (model.status == true) {
          // Check if model.data is not null and not empty
          if (model.data != null && model.data!.isNotEmpty) {
            // Assign the list only if it's not null
            projects.assignAll(model.data!); // Use `!` to assert it's not null
            debugPrint("Projects fetched successfully: ${model.data}");
          } else {
            Get.snackbar('Info', 'No projects available');
            debugPrint("No projects available");
          }
        } else {
          Get.snackbar('Error', model.message ?? 'Invalid response');
          debugPrint("Error: ${model.message}");
        }
      } else {
        debugPrint("Error Response: ${response.body}");
        Get.snackbar('Error', 'Failed to fetch projects: ${response.body}');
      }
    } catch (e) {
      debugPrint("Exception: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  var additionalInfoList = <AdditionalInfoData>[].obs;

  Future<void> fetchAdditionalInfo(String cnic) async {
    try {
      isLoading.value = true;
      debugPrint("Fetching additional info for CNIC: $cnic");

      final Map<String, dynamic> requestBody = {"cnic": cnic.trim()};
      debugPrint("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse(getAdditionalInfoByCNIC),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        var model = AdditionalInfoModel.fromJson(data);
        debugPrint("Response Data: $data");

        if (model.status == true &&
            model.data != null &&
            model.data!.isNotEmpty) {
          additionalInfoList.value = model.data!;
          debugPrint("Additional Info List: ${additionalInfoList}");
        } else {
          Get.snackbar('Error', model.message ?? 'No additional info found.');
          debugPrint("Error: ${model.message}");
        }
      } else {
        Get.snackbar(
            'Error', 'Fetching additional info failed: ${response.body}');
        debugPrint("Error Response: ${response.body}");
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      debugPrint("Exception: $e");
    } finally {
      isLoading.value = false;
      debugPrint("Loading state: ${isLoading.value}");
    }
  }

  Future<void> getPSID(String registration, double amount) async {
    try {
      final Map<String, dynamic> requestBody = {
        "consumerno": "12345", // Replace with appropriate data if needed
        "full_name": "John Doe", // Replace with actual name if needed
        "cnic": registration, // Use the registration parameter here
        "challanId": "12345", // Static value, change if needed
        "due_date": "2024-12-31", // Static date, change if needed
        "iss_date": "2024-12-01", // Static date, change if needed
        "due_amount": amount, // Use the amount parameter
        "adue_amount": amount, // Use the amount parameter
        "reserved": "PHA_Maintenance" // Static value, change if needed
      };

      final response = await http.post(
        Uri.parse(getAdditionalInfoByCNIC),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint("API Response Data: $data");

        if (data['status'] == true) {
          // Handle business logic for successful response
          return data['psid']; // Assuming 'psid' is returned in the response
        } else {
          Get.snackbar('Error', data['message'] ?? 'Invalid credentials');
        }
      } else {
        Get.snackbar('Error', 'Failed to generate PSID: ${response.body}');
      }
    } catch (e) {
      debugPrint("Exception: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
}