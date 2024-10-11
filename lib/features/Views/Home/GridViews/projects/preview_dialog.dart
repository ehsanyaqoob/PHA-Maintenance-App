import 'package:flutter/material.dart';
import 'package:pharesidence/Colors/colors.dart';

class PaymentPreviewDialog extends StatelessWidget {
  final String personName;
  final String propertyName;
  final String PSID;
  final String billDate;
  final String dueDate;
  final double amountDue;
  final double lateFee;
  final double totalAmount;
  final String billingPeriod;
  final String paymentMethod;
  final String apartmentName; // New field
  final String ownerName; // New field
  final String category; // New field (C/D/B)
  final VoidCallback onProceedPayment;

  const PaymentPreviewDialog({
    Key? key,
    required this.personName,
    required this.propertyName,
    required this.PSID,
    required this.billDate,
    required this.dueDate,
    required this.amountDue,
    required this.lateFee,
    required this.totalAmount,
    required this.billingPeriod,
    required this.paymentMethod,
    required this.apartmentName, // Initialize new field
    required this.ownerName, // Initialize new field
    required this.category, // Initialize new field
    required this.onProceedPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [

BoxShadow(
  color: AppColors.AppPrimary, 
  spreadRadius: 0,
  offset: Offset(0, 4), 
  blurRadius: 10, 
),


          ]
        ),
      
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Text(
                    'Maintenance Charges Bill',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.cancel, size: 24, color: Colors.grey),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ),
              ],
            ),
            Divider(thickness: 2, color: Colors.grey[300]),
            SizedBox(height: 10),

            // Consumer Details Section
            Text(
              'Consumer Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _buildDetailRow('Name:', personName),
            _buildDetailRow('Project :', propertyName),
            _buildDetailRow('Apartment:', apartmentName), // Added apartment name
            _buildDetailRow('Owner Name:', ownerName), // Added owner name
            _buildDetailRow('Category:', category), // Added category

            SizedBox(height: 20),

            // Bill Details Section
            Text(
              'Bill Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            _buildDetailRow('PSID:', PSID),
            _buildDetailRow('Period:', billingPeriod),
            _buildDetailRow('Issue Date:', billDate),
            _buildDetailRow('Due Date:', dueDate),
            _buildDetailRow('Maintenance Charges:', '${amountDue.toStringAsFixed(2)}'),
            _buildDetailRow('Late Payment Charges:', '${lateFee.toStringAsFixed(2)}'),
            _buildDetailRow('Total Payable:', '${totalAmount.toStringAsFixed(2)}', isBold: true),
            
            SizedBox(height: 20),
            
            // Payment Instructions Section
            Text(
              'Payment Instructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Please pay the amount through the following methods before the due date to avoid late fees.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              'Payment Methods:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(paymentMethod),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: onProceedPayment,
                child: Text('Proceed to Pay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each row of the bill
  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
