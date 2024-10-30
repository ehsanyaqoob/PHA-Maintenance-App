import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard
import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/features/Payemnts/payment_tab.dart';
import 'package:pharesidence/models/additionalInfo_model.dart';

class GenerateBillPreviewView extends StatelessWidget {
  final String psid;
  final AdditionalInfoData additionalInfo;

  const GenerateBillPreviewView({
    Key? key,
    required this.psid,
    required this.additionalInfo,
  }) : super(key: key);

  void _copyPSID(BuildContext context) {
    Clipboard.setData(ClipboardData(text: psid)).then((_) {
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
                fontSize: 26,
              ),
              Divider(
                thickness: 2,
                color: AppColors.appBlack,
              ),
              SizedBox(height: 15.h),
              PHAText(
                textAlign: TextAlign.center,
                text:
                    'Please make sure that you have copied the \nbelow PSID for making Payments using any mehtod ',
                fontSize: 12.sp,
              ),

              // PSID Section with Copy Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PHAText(
                    textAlign: TextAlign.center,
                    text: 'PSID: $psid',
                    fontWeight: FontWeight.bold,
                    color: AppColors.AppPrimary,
                    fontSize: 16.sp,
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () => _copyPSID(context),
                    tooltip: 'Copy PSID',
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              // Consumer Information Section
              PHAText(
                textAlign: TextAlign.center,
                text: 'Consumer Information',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 15.h),
              GenericDetailsCard(
                details: [
                  {'label': 'Name', 'value': additionalInfo.fullName ?? 'N/A'},
                  {
                    'label': 'Membership No',
                    'value': additionalInfo.registrationNo ?? 'N/A'
                  },
                  {'label': 'CNIC', 'value': additionalInfo.cnic ?? 'N/A'},
                  {
                    'label': 'Lane No',
                    'value': additionalInfo.laneNo?.toString() ?? 'N/A'
                  },
                  {
                    'label': 'House No',
                    'value': additionalInfo.houseNo?.toString() ?? 'N/A'
                  },
                  {
                    'label': 'Category',
                    'value': additionalInfo.category ?? 'N/A'
                  },
                  {
                    'label': 'Project',
                    'value': additionalInfo.projectName ?? 'N/A'
                  },
                  {
                    'label': 'Present Address',
                    'value': additionalInfo.presentAddress ?? 'N/A'
                  },
                  {'label': 'Cell', 'value': additionalInfo.cell ?? 'N/A'},
                  {'label': 'Status', 'value': additionalInfo.status ?? 'N/A'},
                ],
              ),
              SizedBox(height: 15.h),
              Divider(
                thickness: 2,
                color: AppColors.appBlack,
              ),

              // Bill Details Section
              PHAText(
                textAlign: TextAlign.center,
                text: 'Bill Details',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(height: 15.h),
              GenericDetailsCard(
                details: [
                  {
                    'label': 'Issue Date',
                    'value': additionalInfo.issueDate ?? 'N/A'
                  },
                  {
                    'label': 'Due Date',
                    'value': additionalInfo.dueDate ?? 'N/A'
                  },
                  {
                    'label': 'Maintenance Charges',
                    'value': additionalInfo.amount?.toString() ?? 'N/A'
                  },
                  {
                    'label': 'Late Payment Charges',
                    'value': additionalInfo.lateFee?.toString() ?? 'N/A'
                  },
                  {
                    'label': 'Total Amount Due',
                    'value': additionalInfo.totalAmountDue?.toString() ?? 'N/A'
                  },
                ],
              ),
              SizedBox(height: 15.h),

              SizedBox(height: 15.h),

              // // Payment Method Section
              // PHAText(
              //   text: 'Payment Method',
              //   textAlign: TextAlign.center,
              //   fontSize: 22.sp,
              //   fontWeight: FontWeight.bold,
              // ),
              // SizedBox(height: 10.h),
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: AppColors.socialGrey.withOpacity(0.85),
              //         spreadRadius: 2,
              //         blurRadius: 10,
              //         offset: Offset(0, 0),
              //       ),
              //     ],
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       children: [
              //         PHAText(
              //           text: 'Credit Card',
              //           textAlign: TextAlign.center,
              //           fontSize: 16.sp,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20.h),

              SizedBox(height: 20),
              // Payment Button
              PHAButton(
                title: 'Pay Now',
                onTap: () {
                  Get.to(PaymentViews());
                },
              ),
              SizedBox(height: 20.h),

              PHAButton(
                title: 'Print now / Download',
                onTap: () {
                  //
                  Get.snackbar(
                    'Receipt',
                    'Sorry! Receipt / PDF preview is not available.',
                    icon: Icon(Icons.error, color: Colors.white),
                    snackPosition: SnackPosition
                        .TOP, 
                    backgroundColor:
                        Colors.redAccent, 
                    colorText: Colors.white, 
                    borderRadius: 8, 
                    margin:
                        EdgeInsets.all(15), 
                    duration: Duration(seconds: 5), 
                    isDismissible: true, 
                    forwardAnimationCurve:
                        Curves.easeOutBack, 
                  );
                },
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
  final List<Map<String, String>> details;
  final double fontSize;

  const GenericDetailsCard({
    required this.details,
    this.fontSize = 16,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PHAText(
                            textAlign: TextAlign.center,
                            text: detail['label']!,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: AppColors.AppPrimary,
                          ),
                          Expanded(
                            // Ensures text wraps and doesn't overflow
                            child: PHAText(
                              textAlign: TextAlign.end,
                              text: detail['value']!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              fontSize: fontSize,
                              color: AppColors.greycolor,
                            ),
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
