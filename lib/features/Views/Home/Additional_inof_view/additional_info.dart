import 'package:get/get.dart';
import 'package:http/http.dart'
    as http; // Ensure you have the http package imported
import 'package:pharesidence/Generic_Widgets/Radio_Button/pha_radio_button.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'dart:convert'; // Import for jsonEncode and jsonDecode
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Payemnts/payment_tab.dart';
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
                            _buildInfoRow(Icons.money,
                                'Total Amount Due', additionalInfo.amount),
                            _buildInfoRow(Icons.money, 'Late Fee',
                                additionalInfo.lateFee.toString()),
                            _buildInfoRow(
                                Icons.money,
                                'Total Amount Due',
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
                  controller: controller
                      .fullAmountController, 
                  readOnly: true,
                );
              } else {
                return PHATextFormField(
                  hint: 'Enter Partial Amount',
                  controller: controller
                      .partialAmountController,
                  onChanged: (value) {
                    controller
                        .setPartialAmount(value); 
                  },
                  inputType: TextInputType
                      .number,
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
    // final registration = controller.additionalInfoList.first.registrationNo; 
    // final amount = controller.selectedPaymentOption.value == 'Pay full'
    //     ? double.parse(controller.getFullAmount()) 
    //     : double.parse(controller.partialAmount.value); 

    // // Call getPSID and await the response
    // // final psid = await getPSID(registration, amount); 

    // // Navigate to the BillPreviewView with the returned PSID
    // // if (psid != null) {
    // //   Get.to(() => BillPreviewView(psid: psid));
    // // }
    
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

  Future<void> getPSID(String cnic) async {
    try {
      final Map<String, dynamic> requestBody = {
        "consumerno": "12345",
        "full_name": "John Doe",
        "cnic": cnic,
        "challanId": "12345",
        "due_date": "2024-12-31",
        "iss_date": "2024-12-01",
        "due_amount": 1700,
        "adue_amount": 1700,
        "reserved": "PHA_Maintenance",
      };
      final response = await http.post(
        Uri.parse(getAdditionalInfoByCNIC), // Ensure this URL is defined
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      debugPrint("Response Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint("API Response Data: $data");

        if (data['status'] == true) {
          // Handle business logic for successful response, e.g. navigating to Bill Details
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
