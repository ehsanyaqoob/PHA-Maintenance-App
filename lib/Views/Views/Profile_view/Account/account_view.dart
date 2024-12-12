import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class AccountStatementView extends StatefulWidget {
  const AccountStatementView({super.key});

  @override
  State<AccountStatementView> createState() => _AccountStatementViewState();
}

class _AccountStatementViewState extends State<AccountStatementView> {
  final List<Map<String, String>> transactions = [
    {
      "date": "12 Nov 2024",
      "description": "Rent Payment",
      "amount": "-PKR 500/-",
    },
    {
      "date": "10 Nov 2024",
      "description": "Service Charge",
      "amount": "-PKR 50/-",
    },
    {
      "date": "08 Nov 2024",
      "description": "Maintenance Credit",
      "amount": "+PKR 200/-",
    },
    // Add more transactions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Account Statement',
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Summary Section
            Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(top: 20, bottom: 16),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PHAText(
                      text: 'Account Summary',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PHAText(
                          text: 'Total Bill Paid',
                          fontSize: 16,
                          color: AppColors.primary.withOpacity(0.7),
                        ),
                        PHAText(
                          text: 'PKR 1,500/-',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PHAText(
                          text: 'Due Amount',
                          fontSize: 16,
                          color: AppColors.primary.withOpacity(0.7),
                        ),
                        PHAText(
                          text: 'PKR 100',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Download Statement Button
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: PHAButton(
                  onTap: () {
                    // Add functionality to download statement
                  },
                  title: 'Download Statement',

                ),
              ),
            ),

            // Transactions List Section
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 2));
                  // Add refresh functionality
                },
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primary.withOpacity(0.2),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: AppColors.primary,
                          ),
                        ),
                        title: PHAText(
                          text: transaction["description"]!,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        subtitle: PHAText(
                          text: transaction["date"]!,
                          fontSize: 14,
                          color: AppColors.primary.withOpacity(0.6),
                        ),
                        trailing: PHAText(
                          text: transaction["amount"]!,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: transaction["amount"]!.contains('-')
                              ? Colors.redAccent
                              : Colors.green,
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
