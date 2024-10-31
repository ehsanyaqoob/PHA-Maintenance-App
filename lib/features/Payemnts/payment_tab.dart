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
                      _openPaymentPage();

                      print("Bank Transfer selected");
                    }),
                    _buildPaymentCard("1 Bill", 'assets/png/cash.png', () {
                      _openPaymentPage();
                      print("PSID selected");
                    }),
                    _buildPaymentCard(
                        "Credit/Debit Card", 'assets/png/card.png', () {
                      print(
                          'Navigating to PayFast site using external browser');
                      _openPaymentPage();
                    }),
                  ],
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
    final _url = Uri.parse('http://20.46.49.230/api/initiate-payment');
    try {
      // Use launchUrl with error handling
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }
}
