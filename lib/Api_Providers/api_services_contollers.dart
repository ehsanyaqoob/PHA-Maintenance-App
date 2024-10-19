import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import 'Api_Responses/api_urls.dart';

class ApiService {
 

  // Function to get member details by CNIC
  Future<Map<String, dynamic>> getMemberByCnic(String cnic) async {
    try {
      // Construct the API URL
      final url = Uri.parse('$baseUrl/getProjectsByCnic');
      
      // Define request headers (if needed)
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make a POST request with CNIC in body
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({"cnic": cnic}), 
      );

      // Check if the request is successful
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> responseData = json.decode(response.body);

        // Handle the 'data' field in the response
        if (responseData['status'] == true) {
          return responseData;
        } else {
          throw Exception("Error: ${responseData['message']}");
        }
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (error) {
      // Print the error to console and rethrow
      print("Error occurred: $error");
      throw error;
    }
  }
}




class CnicController extends GetxController {
  var isLoading = false.obs;
  var memberData = {}.obs;

  // Reference to the API service
  final ApiService apiService = ApiService();

  // Function to fetch member details by CNIC
  Future<void> fetchMemberByCnic(String cnic) async {
    isLoading.value = true; // Start loading
    try {
      // Call the API service
      final response = await apiService.getMemberByCnic(cnic);

      // Print the response data for debugging
      print("API Response: $response");

      // Update the observable with the data
      memberData.value = response['data'][0];

    } catch (e) {
      // Handle any error here
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}

// class ApiService {
//   Future<Map<String, dynamic>> getPropertyDetails(String projectId) async {
//     // Implement your API call here to fetch property details using the project ID
//     // Example: 
//     final response = await http.get('your-api-url/projects/$projectId');
//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception('Failed to load property details');
//     }
//   }
// }
