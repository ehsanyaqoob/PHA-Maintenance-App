import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';

class GenerateBillPreviewView extends StatelessWidget {
  final String psid; // Add a field for PSID

  const GenerateBillPreviewView({Key? key, required this.psid}) : super(key: key);
  
  void _copyPSID(BuildContext context) {
    // Copy the PSID to the clipboard
    Clipboard.setData(ClipboardData(text: psid)).then((_) {
      // Show a snackbar or a toast to indicate that the PSID has been copied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PSID copied to clipboard!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Bill Preview',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PHAText(
                textAlign: TextAlign.center,
                text: 'Maintenance Charges Bill',
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              Divider(
                thickness: 2,
                color: AppColors.appBlack,
              ),
              SizedBox(height: 15.h),

              // New section to display PSID with a copy icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PHAText(
                    textAlign: TextAlign.center,
                    text: 'PSID: $psid', 
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  IconButton(
                    icon: Icon(Icons.copy), // Copy icon
                    onPressed: () => _copyPSID(context), // Copy action
                    tooltip: 'Copy PSID',
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              PHAText(
                textAlign: TextAlign.center,
                text: 'Consumer Information',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 15.h),
              GenericDetailsCard(
                details: [
                  {'label': 'Name', 'value': 'Riaz Shakeel'},
                  {'label': 'Property', 'value': 'Apartment 23D'},
                  {'label': 'Location', 'value': 'Kuri Road'},
                  {'label': 'Category', 'value': 'Type C'},
                ],
              ),
              SizedBox(height: 15.h),
              Divider(
                thickness: 2,
                color: AppColors.appBlack,
              ),
              PHAText(
                textAlign: TextAlign.center,
                text: 'Bill Details',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 15.h),
              GenericDetailsCard(
                details: [
                  {'label': 'Bill No', 'value': '123567'},
                  {'label': 'Period', 'value': '1 month'},
                  {'label': 'Issue Date', 'value': '10/10/2024'},
                  {'label': 'Due Date', 'value': '10/11/2024'},
                  {'label': 'Maintenance Charges', 'value': '4500'},
                  {'label': 'Late Payment Charges', 'value': '200'},
                  {'label': 'Total Charges', 'value': '4700'},
                ],
              ),
              SizedBox(height: 15.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.socialGrey.withOpacity(0.85),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      PHAText(
                        text: 'Please pay the amount through the following methods before the due date to avoid late fees.',
                        textAlign: TextAlign.center,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              PHAText(
                text: 'Payment Method',
                textAlign: TextAlign.center,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.socialGrey.withOpacity(0.85),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      PHAText(
                        text: 'Credit Card',
                        textAlign: TextAlign.center,
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              PHAButton(
                title: 'Proceed to Pay',
                fillColor: true,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class GenericDetailsCard extends StatelessWidget {
  final List<Map<String, String>> details; // List of key-value pairs
  final double fontSize;

  GenericDetailsCard({
    required this.details,
    this.fontSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.socialGrey.withOpacity(0.85),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: details
              .map((detail) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PHAText(
                            text: detail['label']!,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                          ),
                          PHAText(
                            text: detail['value']!,
                            fontSize: fontSize,
                          ),
                        ],
                      ),
                      Divider(thickness: 1, color: AppColors.greycolor),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
