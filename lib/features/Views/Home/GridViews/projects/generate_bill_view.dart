import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert'; // For JSON decoding

// Dummy JSON data as a string
const String dummyJson = '''
{
  "tenantName": "John Doe",
  "apartmentNumber": "A-101",
  "amountDue": 150.00,
  "dueDate": "2024-10-30"
}
''';

// Bill Model Class
class Bill {
  final String tenantName;
  final String apartmentNumber;
  final double amountDue;
  final DateTime dueDate;

  Bill({
    required this.tenantName,
    required this.apartmentNumber,
    required this.amountDue,
    required this.dueDate,
  });
}

// BillController using GetX
class BillController extends GetxController {
  var bill = Bill(
    tenantName: '',
    apartmentNumber: '',
    amountDue: 0.0,
    dueDate: DateTime.now(),
  ).obs;

  // Function to generate a bill from dummy JSON
  void generateBillFromJson() {
    final Map<String, dynamic> jsonData = json.decode(dummyJson);
    bill.value = Bill(
      tenantName: jsonData['tenantName'],
      apartmentNumber: jsonData['apartmentNumber'],
      amountDue: jsonData['amountDue'],
      dueDate: DateTime.parse(jsonData['dueDate']),
    );
  }
}

// Main Screen with Dialog and Bill Generation Logic
class MaintenanceBillScreen extends StatelessWidget {
  final BillController controller = Get.put(BillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate Maintenance Bill')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.generateBillFromJson(); // Generate bill from JSON
            showBillPreviewDialog(controller); // Display the dialog
          },
          child: const Text('Generate Bill'),
        ),
      ),
    );
  }

  // Function to show the Bill Preview Dialog with enhanced UI
  void showBillPreviewDialog(BillController controller) {
    Get.defaultDialog(
      title: 'Maintenance Bill Preview',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      content: Obx(() {
        final billDetails = controller.bill.value;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailRow('Tenant Name', billDetails.tenantName),
            _buildDetailRow('Apartment Number', billDetails.apartmentNumber),
            _buildDetailRow('Amount Due', '\$${billDetails.amountDue.toStringAsFixed(2)}'),
            _buildDetailRow('Due Date', billDetails.dueDate.toLocal().toString().split(' ')[0]),
          ],
        );
      }),
      confirm: ElevatedButton.icon(
        onPressed: () {
          // Handle confirmation (e.g., save, print, etc.)
          Get.back();
        },
        icon: const Icon(Icons.check),
        label: const Text('Confirm'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
      ),
      cancel: ElevatedButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.cancel),
        label: const Text('Cancel'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
      ),
      radius: 15,
    );
  }

  // Helper method to build each row in the bill preview
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(value),
        ],
      ),
    );
  }
}

