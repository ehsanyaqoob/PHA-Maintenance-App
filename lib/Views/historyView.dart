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
            AppBackButton(title: 'Previous Bills / سابقہ بل'),
            Positioned(
              top: 0 + 35.h + 36,
              left: 12,
              right: 12,
              bottom: 0,
              child: Obx(()=>Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                        flex: 2,
                        child: Container()
                      ),
                      Expanded(
                          child: PHAText(
                            text: 'PAYABLE',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackGray,
                          )),

                      VerticalDivider(color: AppColors.lightGray_1, width: 1),

                      Expanded(
                          child: PHAText(
                            text: 'PAID',
                            textAlign: TextAlign.center,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackGray,
                          )),

                      SizedBox(width: 24.w,)

                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.listOfHistory.length,
                      itemBuilder: (context, index) {
                        var bill = controller.listOfHistory[index];

                        var lateFee = double.parse(bill.lateFeeCharges ?? '0');
                        var totalAmount = double.parse(bill.totalAmount ?? '0') + double.parse(bill.lateFeeCharges ?? '0') + double.parse(bill.arears ?? '0');


                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Slightly more rounded corners
                          ),
                          elevation: 6, // Increased elevation for a more pronounced shadow
                          color: Colors.white, // Set the card color to white for better contrast
                          child: Theme(
                            data: ThemeData().copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              // showTrailingIcon: false,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Row(
                                    children: [

                                      Expanded(
                                        flex: 2,
                                        child: ListTile(
                                            visualDensity: VisualDensity.compact,
                                            // leading: CircleAvatar(
                                            //   radius: 20,
                                            //   backgroundColor: AppColors.primary.withOpacity(0.2),
                                            //   child: Icon(
                                            //     bill.billStatus == "Paid" ? Icons.check_circle : Icons.error,
                                            //     color: bill.billStatus == "Paid" ? Colors.green : Colors.red,
                                            //   ),
                                            // ),
                                            title: PHAText(
                                              text: bill.issuedDate?.formatDate() ?? '',
                                              fontSize: 16.sp, // Larger font size for better readability
                                              fontWeight: FontWeight.w600,
                                            ),
                                            subtitle: Row(
                                              children: [
                                                // PHAText(
                                                //   text: "Status: ",
                                                //   fontSize: 12.sp,
                                                //   fontWeight: FontWeight.w400,
                                                //   color: AppColors.blackGray,
                                                // ),
                                                PHAText(
                                                  text: "${bill.billStatus}",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: bill.billStatus?.toLowerCase() == "paid"
                                                      ? Color(0xFF02B101)
                                                      : Color(0xFFD5210F),
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: PHAText(
                                            text: '${totalAmount}',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: totalAmount > 0 ? AppColors.blackGray : AppColors.red,
                                          )),

                                      VerticalDivider(color: AppColors.lightGray_1, width: 1),

                                      Expanded(
                                          flex: 1,
                                          child: PHAText(
                                            text: '${bill.paidAmount ?? 0}',
                                            textAlign: TextAlign.center,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            color: double.parse(bill.paidAmount ?? '0') > 0 ? AppColors.blackGray : AppColors.red,
                                          )),

                                    ],
                                  ),
                                ],
                              ),
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Divider(height: 1, color: Colors.grey,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        child: Row(
                                          children: [
                                            HistoryItem(title: 'Due Amount', value: '${bill.totalAmount}'),

                                            HistoryItem(title: 'Late Fee ', value: '${bill.lateFeeCharges}'),

                                            HistoryItem(title: 'Arears', value: '${bill.arears}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );

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
                              text: '${totalAmount}',
                              fontSize: 16.sp, // Larger font size for the amount
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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

class HistoryItem extends StatelessWidget {
  String title, value;
  HistoryItem(
      {super.key,
        required this.title,
        required this.value
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PHAText(
              text: title.toUpperCase(),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackGray,
            ),
            SizedBox(height: 2.h),
            PHAText(
              text: value.toUpperCase(),
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: double.parse(value) > 0 ? AppColors.blackGray : AppColors.red,
            ),
          ],
        ),
      ),
    );
  }
}
