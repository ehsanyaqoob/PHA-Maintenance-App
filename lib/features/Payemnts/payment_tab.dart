import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Api_Providers/Api_Responses/api_urls.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/GenerateBill/generate_bill_preview.dart';

class PaymentViews extends StatefulWidget {
  const PaymentViews({super.key});

  @override
  State<PaymentViews> createState() => _PaymentViewsState();
}

class _PaymentViewsState extends State<PaymentViews> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Options',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/png/back.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: PHAText(
                    text: "Select Payment Method",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Payment Method List
                Column(
                  children: [
                    _buildPaymentCard("Bank Transfer", 'assets/png/bank.png',
                        () {
                      // Navigate to Bank Transfer Payment
                      print("Bank Transfer selected");
                    }),
                    _buildPaymentCard("PSID", 'assets/png/cash.png', () {
                      // Navigate to PSID Payment
                      print("PSID selected");
                    }),
                    _buildPaymentCard("Cash", 'assets/png/cash.png', () {
                      // Navigate to Cash Payment
                      print("Cash selected");
                    }),
                    _buildPaymentCard(
                        "Credit/Debit Card", 'assets/png/card.png', () {
                      _openPaymentPage();
                    }),
                    _buildPaymentCard("Others", 'assets/png/cash.png', () {
                      // Navigate to Other Payment Options
                      print("Others selected");
                    }),
                  ],
                ),
                SizedBox(height: 30.h),
                // Pay Now Button Section
                Center(
                  child: PHAButton(
                    title: 'Pay Now',
                    onTap: () {
                      Get.to(BillPreviewView(
                        psid: '',
                      ));
                      print('Pay Now Button Pressed');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Payment Method Card Widget
  Widget _buildPaymentCard(String title, String iconPath, VoidCallback onTap) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.servicecards, AppColors.CardColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.AppPrimary.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          iconPath,
          width: 40,
          height: 40,
        ),
        title: PHAText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.AppSecondary,
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.AppSecondary),
        onTap: onTap,
      ),
    );
  }

  void _openPaymentPage() async {
    try {
      // Check if the URL can be launched
      if (await canLaunch(payFastUrl)) {
        // Request permission to open the browser
        final bool permissionGranted = await _requestBrowserPermission();
        if (permissionGranted) {
          // Launch the URL
          await launch(payFastUrl);
        }
      } else {
        Get.snackbar('Error',
            'Cannot launch the URL. Please check your connection or URL.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }

  Future<bool> _requestBrowserPermission() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Permission Required"),
              content: Text(
                  "This will open your browser to complete the payment. Do you want to proceed?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes"),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
