import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/Home/Additional_inof_view/additional_info.dart';

import 'package:pharesidence/Views/Views/GenerateBill/generate_bill_preview.dart';

class HistoryView extends StatefulWidget {
  String membershipID;
  HistoryView({super.key, required this.membershipID});
  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {

  var controller = Get.find<PropertyController>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      controller.fetchHistory(membershipNo: widget.membershipID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppBackground(),
            AppBackButton(title: 'Previous Bills'),
            Positioned(
              top: 0 + 35.h + 36,
              left: 12,
              right: 12,
              bottom: 0,
              child: Obx(()=>ListView.builder(
                itemCount: controller.listOfHistory.length,
                itemBuilder: (context, index) {
                  var bill = controller.listOfHistory[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Slightly more rounded corners
                    ),
                    elevation: 6, // Increased elevation for a more pronounced shadow
                    color: Colors.white, // Set the card color to white for better contrast
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8, // Adjust padding for more space
                        horizontal: 16,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary.withOpacity(0.2),
                        child: Icon(
                          bill.billStatus == "Paid" ? Icons.check_circle : Icons.error,
                          color: bill.billStatus == "Paid" ? Colors.green : Colors.red,
                        ),
                      ),
                      title: PHAText(
                        text: bill.issuedDate?.formatDate() ?? '',
                        fontSize: 16.sp, // Larger font size for better readability
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: Row(
                        children: [
                          PHAText(
                            text: "Status: ",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackGray,
                          ),
                          PHAText(
                            text: "${bill.billStatus}",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: bill.billStatus?.toLowerCase() == "paid"
                                ? Color(0xFF02B101)
                                : Color(0xFFD5210F),
                          ),
                        ],
                      ),
                      trailing: PHAText(
                        text: bill.totalAmount ?? '',
                        fontSize: 16.sp, // Larger font size for the amount
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              )),
            ),
            Align(
              alignment: Alignment.center,
              child: Obx(() => Visibility(
                  visible: controller.isBusy!.value, child: PHALoader())),
            )
          ],
        ),
      ),
    );
  }
}
