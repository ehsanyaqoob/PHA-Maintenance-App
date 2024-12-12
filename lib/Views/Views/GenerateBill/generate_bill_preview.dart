import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Payemnts/payment_tab.dart';

class GenerateBillPreviewView extends StatefulWidget {
  String membershipID;
  GenerateBillPreviewView({Key? key, required this.membershipID}) : super(key: key);
  @override
  State<GenerateBillPreviewView> createState() =>
      _GenerateBillPreviewViewState();
}

class _GenerateBillPreviewViewState extends State<GenerateBillPreviewView> {
  final controller = Get.find<PropertyController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      controller.fetchPSID(membershipNo: widget.membershipID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Stack(
              children: [

                AppBackground(),

                AppBackButton(title: 'Maintenance Bill Charges'),

                Obx(() => Positioned(
                  top: 0 + 35.h + 24,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PHAText(
                          textAlign: TextAlign.center,
                          text: 'Consumer Information',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: 15),

                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PHAText(
                              textAlign: TextAlign.center,
                              text: 'PSID: ${controller.psidInfo.value.psid ?? ''}',
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontSize: 16,
                            ),
                            IconButton(
                              icon: Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: controller.psidInfo.value.psid ?? ''));

                                // Show Snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: PHAText(
                                        fontSize: 16,
                                        color: AppColors.secondary,
                                        text: 'PSID has been copied'),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(
                                      bottom: 100.0,
                                      left: 16.0,
                                      right: 16.0,
                                    ),
                                    backgroundColor: AppColors.primary,
                                  ),
                                );
                              },
                              tooltip: 'Copy PSID',
                            ),
                          ],
                        )),

                        GenericDetailsCard(
                          details: [
                            {
                              'label': 'Name',
                              'value': controller.additionalInfo.value?.fullName ??
                                  'N/A'
                            },
                            {
                              'label': 'Membership No',
                              'value': controller
                                  .additionalInfo.value?.registrationNo ??
                                  'N/A'
                            },
                            {
                              'label': 'CNIC',
                              'value':
                              controller.additionalInfo.value?.cnic ?? 'N/A'
                            },
                            {
                              'label': 'Lane No',
                              'value': controller.additionalInfo.value?.laneNo
                                  ?.toString() ??
                                  'N/A'
                            },
                            {
                              'label': 'House No',
                              'value': controller.additionalInfo.value?.houseNo
                                  ?.toString() ??
                                  'N/A'
                            },
                            {
                              'label': 'Category',
                              'value': controller.additionalInfo.value?.category ??
                                  'N/A'
                            },
                            {
                              'label': 'Project',
                              'value':
                              controller.additionalInfo.value?.projectName ??
                                  'N/A'
                            },
                            {
                              'label': 'Present Address',
                              'value': controller
                                  .additionalInfo.value?.presentAddress ??
                                  'N/A'
                            },
                            {
                              'label': 'Cell',
                              'value':
                              controller.additionalInfo.value?.cell ?? 'N/A'
                            },
                            {
                              'label': 'Status',
                              'value':
                              controller.additionalInfo.value?.status ?? 'N/A'
                            },
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(thickness: 2, color: AppColors.blackGray),
                        PHAText(
                          textAlign: TextAlign.center,
                          text: 'Bill Details',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        SizedBox(height: 15),
                        GenericDetailsCard(
                          details: [
                            {
                              'label': 'Issue Date',
                              'value':
                              controller.additionalInfo.value?.issueDate?.formatDate() ??
                                  'N/A'
                            },
                            {
                              'label': 'Due Date',
                              'value':
                              controller.additionalInfo.value?.dueDate?.formatDate() ?? 'N/A'
                            },
                            {
                              'label': 'Maintenance Charges',
                              'value': controller.additionalInfo.value?.amount?.formatAsNumber() ?? 'N/A'
                            },
                            {
                              'label': 'Late Payment Charges',
                              'value': controller.additionalInfo.value?.lateFee
                                  ?.toString() ??
                                  'N/A'
                            },
                            {
                              'label': 'Total Amount Due',
                              'value': controller
                                  .additionalInfo.value?.totalAmountDue?.formatAsNumber() ?? ''
                            },
                            {
                              'label': 'Partial Amount',
                              'value':
                              controller.fullAmountController.text.formatAsNumber()
                            },
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              PHAButton(
                                title: 'Pay Now',
                                onTap: () {
                                  Get.to(PaymentViews());
                                },
                              ),
                              SizedBox(height: 20),
                              PHAButton(
                                title: 'Print / Download',
                                onTap: () => controller.downloadPDF(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],


                    ),
                  ),
                )),

                Align(
                  alignment: Alignment.center,
                  child: Obx(() =>
                      Visibility(visible: controller.isBusy!.value, child: PHALoader())),
                )
              ],
            ),
          ),
        ),
      ],
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGray_1, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray_1.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: details
                .map((detail) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PHAText(
                              text: detail['label']!,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: AppColors.blackGray,
                            ),
                            Expanded(
                              // Ensures text wraps and doesn't overflow
                              child: PHAText(
                                textAlign: TextAlign.end,
                                text: detail['value']!,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14.sp,
                                color: AppColors.blackGray,
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 1, color: AppColors.lightGray_2),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}


extension NumberFormatter on String {
  /// Formats a string containing a number to have commas and rounded to 2 decimal places
  String formatAsNumber() {
    try {
      double number = double.parse(this);
      NumberFormat formatter = NumberFormat("#,##0.00");
      return formatter.format(number);
    } catch (e) {
      return this;
    }
  }
}

extension DateFormatter on String {
  /// Converts a date string in 'yyyy-MM-dd' format to 'MMM d, yyyy' format
  String formatDate() {
    try {
      // Parse the string to a DateTime object
      DateTime date = DateFormat('yyyy-MM-dd').parse(this);

      // Format the date to 'Jul 13, 2019' style
      String formattedDate = DateFormat('MMM d, yyyy').format(date);

      return formattedDate;
    } catch (e) {
      // If parsing fails, return the original string
      return this;
    }
  }
}
