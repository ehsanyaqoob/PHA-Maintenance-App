import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';

import '../Views/Home/GridViews/projects/preview_dialog.dart'; // Assuming custom widgets like `PHAButton` and `CustomAppBar` are in this package.

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  void showSnackbar(String message) {
    Get.snackbar(
      "Payment Method Selected",
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void showPaymentDialog(String paymentMethod) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from closing on outside tap
      builder: (BuildContext context) {
        return PaymentPreviewDialog(
          personName: 'MRS. AMIR JAN',
          propertyName: 'Apartment 23B',
          PSID: '12345',
          billDate: '2024-09-30',
          dueDate: '2024-10-30',
          amountDue: 150.75,
          lateFee: 5.00,
          totalAmount: 155.75,
          billingPeriod: 'Sep 2024',
          paymentMethod: paymentMethod,
          apartmentName: 'Kurri road', // Provide apartment name
          ownerName: 'MRS. AMIR JAN', // Provide owner name
          category: 'C', // Provide category (C/D/B)
          onProceedPayment: () {
            Navigator.of(context).pop(); // Close the current dialog

            // Show a new dialog with Pay and Download buttons
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent dialog from closing on outside tap
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Payment Options'),
                  content: Text('What would you like to do next?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        // Add the logic to proceed with the payment
                        // For example, navigate to a payment screen
                      },
                      child: Text('Pay'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        // Add the logic to download the bill/receipt
                        // For example, show a message or initiate the download
                      },
                      child: Text('Download'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget buildPaymentRow(String title1, String title2) {
    return Row(
      children: [
        Expanded(
          child: PHAButton(
            title: title1,
            fillColor: true,
            onTap: () {
              showSnackbar("$title1 payment method selected.");
              showPaymentDialog(title1); // Show the dialog when this method is selected
            },
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: PHAButton(
            title: title2,
            fillColor: true,
            onTap: () {
              showSnackbar("$title2 payment method selected.");
              showPaymentDialog(title2); // Show the dialog when this method is selected
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Payment',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                buildPaymentRow('Banks', 'PSID'),
                const SizedBox(height: 20),
                buildPaymentRow('Credit Card', 'Mobile Wallet'),
                const SizedBox(height: 20),
                buildPaymentRow('Cash', 'Other'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
