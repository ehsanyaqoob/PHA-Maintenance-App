import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class PayeeManagementView extends StatefulWidget {
  const PayeeManagementView({super.key});

  @override
  State<PayeeManagementView> createState() => _PayeeManagementViewState();
}

class _PayeeManagementViewState extends State<PayeeManagementView> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _dateFilterController = TextEditingController();
  DateTime? selectedDate;

  final List<Map<String, String>> bills = [
    {"month": "October 2024", "amount": "PKR 5000/-", "status": "Paid"},
    {"month": "September 2024", "amount": "PKR 4500/-", "status": "Unpaid"},
    {"month": "August 2024", "amount": "PKR 5000/-", "status": "Paid"},
  ];


  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateFilterController.text = DateFormat.yMMMM().format(picked);
      });
    }
  }

  Future<void> _refreshBills() async {
    // Simulating a network call or data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Refresh the bills data or logic if necessary
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'History',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            SizedBox(height: 24.h),
            PHATextFormField(
              controller: _searchController,
              hint: 'Search by month (e.g., October)',
              prefix: Icon(Icons.search, color: AppColors.primary),
              suffix: IconButton(
                icon: Icon(Icons.calendar_today, color: AppColors.primary),
                onPressed: () => _pickDate(context),
              ),
              onChanged: (value) {
                setState(() {}); // Update the list based on search input
              },
            ),

            // Date Filter Display
            if (_dateFilterController.text.isNotEmpty) ...[
              SizedBox(height: 10),
              PHAText(
                text: 'Selected Month: ${_dateFilterController.text}',
                fontSize: 16,
                color: AppColors.primary,
              ),
            ],

            const SizedBox(height: 16),

            // Bill List Section
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshBills, // Trigger the refresh logic
                child: ListView.builder(
                  itemCount: bills.length,
                  itemBuilder: (context, index) {
                    final bill = bills[index];

                    // Filter based on selected date or search input
                    if ((_dateFilterController.text.isNotEmpty &&
                            !bill["month"]!
                                .toLowerCase()
                                .contains(_dateFilterController.text.toLowerCase())) ||
                        (_searchController.text.isNotEmpty &&
                            !bill["month"]!
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))) {
                      return SizedBox();
                    }

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Slightly more rounded corners
                      ),
                      elevation: 6, // Increased elevation for a more pronounced shadow
                      color: Colors.white, // Set the card color to white for better contrast
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, // Adjust padding for more space
                          horizontal: 16,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary.withOpacity(0.2),
                          child: Icon(
                            bill["status"] == "Paid" ? Icons.check_circle : Icons.error,
                            color: bill["status"] == "Paid" ? Colors.green : Colors.red,
                          ),
                        ),
                        title: PHAText(
                          text: bill["month"]!,
                          fontSize: 18, // Larger font size for better readability
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        subtitle: PHAText(
                          text: "Status: ${bill["status"]}",
                          fontSize: 14,
                          color: bill["status"] == "Paid"
                              ? Colors.green.withOpacity(0.8)
                              : Colors.red.withOpacity(0.8),
                        ),
                        trailing: PHAText(
                          text: bill["amount"]!,
                          fontSize: 18, // Larger font size for the amount
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
