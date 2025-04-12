import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Payemnts/payment_tab.dart';

class GenerateBillPreviewView extends StatefulWidget {
  AdditionalInfoModel property;
  String amount;
  GenerateBillPreviewView({Key? key, required this.property, required this.amount}) : super(key: key);
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
      controller.fetchPSID(property: widget.property);
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

                AppBackButton(title: 'Congratulations'),

                Positioned(
                  top: 0 + 35.h + 24,
                  left: 16,
                  right: 16,
                  bottom: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Obx(() => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightGray_1.withOpacity(0.85),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFcdfef0).withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        PHAText(
                                          textAlign: TextAlign.center,
                                          text: 'Payment Slip ID (PSID)',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                          fontSize: 14.sp,
                                        ),

                                        SizedBox(height: 2.h),

                                        PHAText(
                                          textAlign: TextAlign.center,
                                          text: '${controller.psidInfo.value.psid ?? ''}',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary,
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ),

                                    Spacer(),

                                    GestureDetector(
                                      onTap: (){
                                        Clipboard.setData(
                                            ClipboardData(text: controller.psidInfo.value.psid ?? ''));
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: PHAText(
                                                fontSize: 16,
                                                color: AppColors.white,
                                                text: 'PSID has been copied'),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: AppColors.lightGray_1,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:  BorderRadius.circular(45/2)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            children: [

                                              Icon(Icons.copy, size: 12.h),

                                              SizedBox(width: 2.w),

                                              PHAText(
                                                // textAlign: TextAlign.center,
                                                text: 'Copy',
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackGray,
                                                fontSize: 10.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 4.w),

                                    GestureDetector(
                                      onTap: (){
                                        controller.downloadPDF();
                                      },
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:  BorderRadius.circular(45/2)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            children: [

                                              Icon(Icons.download, size: 10.h),

                                              SizedBox(width: 2.w),

                                              PHAText(
                                                // textAlign: TextAlign.center,
                                                text: 'PDF',
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackGray,
                                                fontSize: 10.sp,
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    AdditionalInfoItem(title: 'Name', description: widget.property.fullName ?? ''),

                                    AdditionalInfoItem(title: 'Due Date', description: widget.property.dueDate?.formatDate() ?? ''),

                                    AdditionalInfoItem(title: 'Payable Amount', description: widget.amount.formatAsNumber()),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                              child: Row(
                                children: [
                                  Spacer(),
                                  PHAText(
                                    textAlign: TextAlign.center,
                                    text: 'Transaction charges apply.',
                                    color: AppColors.lightGray_1,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )),



                      SizedBox(height: 16.h),

                      PHAText(
                        text: 'PSID has been successfully generated. You can use it to make payments through internet banking, ATMs, mobile banking (like JazzCash, Easypaisa etc.) under 1 Link / 1 Bill invoice, without visiting the branch. After payment you will receive a confirmation SMS.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 8.h),

                      PHAText(
                        text: ' پی ایس آئی ڈی کامیابی کے ساتھ تیار ہو گیا ہے۔ آپ برانچ میں گئے بغیر 1 لنک / 1 بل انوائس کے تحت انٹرنیٹ بینکنگ، اے ٹی ایم، موبائل بینکنگ (جیسے جاز کیش، ایزی پیسہ وغیرہ) کے ذریعے ادائیگی کرنے کے لیے اسے استعمال کر سکتے ہیں۔ ادائیگی کے بعد آپ کو ایک تصدیقی ایس ایم ایس موصول ہوگا۔',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.justify,
                      ),

                      Spacer(),

                      Column(
                        children: [
                          // PHAButton(
                          //   title: 'Pay Online Through Card',
                          //   filledColor: AppColors.primary,
                          //   onTap: () => controller.generatePayFastLink(),
                          // ),
                          // const SizedBox(height: 12),
                          // PHAText(
                          //   text: 'OR',
                          //   textAlign: TextAlign.center,
                          //   fontSize: 13.sp,
                          //   fontWeight: FontWeight.w500,
                          //   color: Colors.black,
                          // ),
                          // SizedBox(height: 14),
                          // PHAButton(
                          //   title: 'Download Bank Slip',
                          //   filledColor: AppColors.secondary,
                          //   onTap: () => controller.downloadPDF,
                          // ),
                          // SizedBox(height: 20),
                          PHAButton(
                            title: 'Done',
                            filledColor: AppColors.primary,
                            onTap: () => Get.close(3),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                    ],


                  ),
                ),

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
                            Expanded(
                              child: PHAText(
                                text: detail['label']!,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              flex: 1,
                              child: PHAText(
                                text: detail['value']!,
                                color: AppColors.blackGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
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


// extension NumberFormatter on String {
//   /// Formats a string containing a number to have commas and rounded to 2 decimal places
//   String formatAsNumber() {
//     try {
//       double number = double.parse(this);
//       NumberFormat formatter = NumberFormat("#,##0.00");
//       return formatter.format(number);
//     } catch (e) {
//       return this;
//     }
//   }
// }
//
// extension DateFormatter on String {
//   /// Converts a date string in 'yyyy-MM-dd' format to 'MMM d, yyyy' format
//   String formatDate() {
//     try {
//       // Parse the string to a DateTime object
//       DateTime date = DateFormat('yyyy-MM-dd').parse(this);
//
//       // Format the date to 'Jul 13, 2019' style
//       String formattedDate = DateFormat('MMM d, yyyy').format(date);
//
//       return formattedDate;
//     } catch (e) {
//       // If parsing fails, return the original string
//       return this;
//     }
//   }
// }
