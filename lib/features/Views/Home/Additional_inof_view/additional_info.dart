import 'package:get/get.dart';
import 'package:http/http.dart'
    as http; // Ensure you have the http package imported
import 'package:pharesidence/Generic_Widgets/Radio_Button/pha_radio_button.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'dart:convert'; // Import for jsonEncode and jsonDecode
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Payemnts/payment_tab.dart';
import 'package:pharesidence/models/get_psid_model.dart';
import '../../../../Api_Providers/Api_Responses/api_urls.dart';
import '../../../../Shared/Controllers.dart/project_controller.dart';
import '../../GenerateBill/generate_bill_preview.dart';

class AdditionalProjectDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProjectsViewController>();

    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Additional Project Details',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.additionalInfoList.isEmpty) {
                  return Center(
                      child: PHAText(text: "No additional info available."));
                }

                return ListView.builder(
                  itemCount: controller.additionalInfoList.length,
                  itemBuilder: (context, index) {
                    final additionalInfo = controller.additionalInfoList[index];

                    return Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project Name with Bold Styling
                            Row(
                              children: [
                                Icon(Icons.business, color: Colors.blueAccent),
                                SizedBox(width: 8),
                                PHAText(
                                  text:
                                      'Project Name: ${additionalInfo.projectName ?? 'N/A'}',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ],
                            ),

                            Divider(color: AppColors.AppPrimary, thickness: 1),

                            // Category and other information
                            _buildInfoRow(Icons.category, 'Category',
                                additionalInfo.category),
                            _buildInfoRow(
                                Icons.map, 'Lane No', additionalInfo.laneNo),
                            _buildInfoRow(
                                Icons.home, 'House No', additionalInfo.houseNo),
                            _buildInfoRow(
                                Icons.phone, 'Cell', additionalInfo.cell),
                            _buildInfoRow(
                                Icons.info, 'Status', additionalInfo.status),

                            SizedBox(height: 12),
                            Divider(color: AppColors.AppPrimary, thickness: 1),

                            // Date and financial information
                            _buildInfoRow(Icons.calendar_today, 'Issue Date',
                                additionalInfo.issueDate),
                            _buildInfoRow(Icons.calendar_today_outlined,
                                'Due Date', additionalInfo.dueDate),
                            _buildInfoRow(Icons.money, 'Total Amount Due',
                                additionalInfo.amount),
                            _buildInfoRow(Icons.money, 'Late Fee',
                                additionalInfo.lateFee.toString()),
                            _buildInfoRow(Icons.money, 'Total Amount Due',
                                additionalInfo.totalAmountDue.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            PHARadioButton(
              items: ['Pay full', 'Pay Partial'],
              selectedValue: controller.selectedPaymentOption.value,
              onSelected: (value) {
                controller.setPaymentOption(value);
              },
            ),
            SizedBox(height: 20),

            Obx(() {
              if (controller.selectedPaymentOption.value == 'Pay full') {
                return PHATextFormField(
                  hint: 'Total Amount Due',
                  controller: controller.fullAmountController,
                  readOnly: true,
                );
              } else {
                return PHATextFormField(
                  hint: 'Enter Partial Amount',
                  controller: controller.partialAmountController,
                  onChanged: (value) {
                    controller.setPartialAmount(value);
                  },
                  inputType: TextInputType.number,
                );
              }
            }),

            SizedBox(height: 20),
            Divider(color: AppColors.AppPrimary, thickness: 1),

            SizedBox(height: 20),
            // Payment Button
            PHAButton(
              title: 'Pay Now',
              onTap: () {
                Get.to(PaymentViews());
              },
            ),
            SizedBox(height: 20),

            PHAButton(
              title: 'Generate Bill',
              onTap: () async {
                try {
                  // Retrieve registration number and payment amount based on user selection
                  final registrationNo =
                      controller.additionalInfoList.first.registrationNo;
                  final amount =
                      controller.selectedPaymentOption.value == 'Pay full'
                          ? double.parse(controller.getFullAmount())
                          : double.parse(controller.partialAmount.value);
                  // Call getPSID function to retrieve the PSID
                  final result = await getPSID(registrationNo, amount);
                  // Check if result is not null
                  if (result != null) {
                    final psid = result["psid"];
                    // Navigate to the BillPreviewView with the PSID
                    Get.to(() => GenerateBillPreviewView(psid: psid));
                  } else {
                    // Handle the case where PSID is null
                    Get.snackbar(
                        'Error', 'Failed to generate PSID. Please try again.');
                  }
                } catch (e) {
                  // Handle any exceptions that might occur during the process
                  Get.snackbar('Error', 'An unexpected error occurred: $e');
                }
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper function for building each row with icons
  Widget _buildInfoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 20),
          SizedBox(width: 10),
          PHAText(
            text: '$label: ${value ?? 'N/A'}',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>?> getPSID(
      String registrationNo, double amount) async {
    try {
      // Constructing the request body with the required parameters
      final Map<String, dynamic> requestBody = {
        "registration_no": registrationNo,
        "amount": amount.toString(), // Convert amount to String
      };

      debugPrint("Request Body: $requestBody");

      // Sending the POST request
      final response = await http.post(
        Uri.parse(GetPsid), // Use the constant GetPsid for the URL
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody), // Encoding the request body as JSON
      );

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse the response body
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == true && responseData['data'] != null) {
          // Extract the required parameters from the response
          final String psid = responseData['data'][0]['psid'];

          // You can fetch any other parameters you need similarly
          // For example, if you need 'message' from the response:
          final String message = responseData['message'];

          // Return the parameters in a map
          return {
            "psid": psid,
            "message": message,
          };
        } else {
          Get.snackbar('Error',
              'Failed to get valid response: ${responseData['message']}');
        }
      } else {
        Get.snackbar('Error', 'Failed to generate PSID: ${response.body}');
      }
    } catch (e) {
      debugPrint("Exception: $e");
      Get.snackbar('Error', 'An error occurred: $e');
    }
    return null; // Return null in case of any failure
  }
}
