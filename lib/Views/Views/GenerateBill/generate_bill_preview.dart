import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Payemnts/payment_tab.dart';

class GenerateBillPreviewView extends StatefulWidget {
  Property property;
  GenerateBillPreviewView({Key? key, required this.property}) : super(key: key);
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

                AppBackButton(title: 'Generated Bill'),

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
                            color: Color(0xFFcdfef0).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PHAText(
                                textAlign: TextAlign.center,
                                text: 'Payment Slip ID (PSID)',
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                fontSize: 14.sp,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PHAText(
                                    textAlign: TextAlign.center,
                                    text: '${controller.psidInfo.value.psid ?? ''}',
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                    fontSize: 16.sp,
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
                              )
                            ],
                          ),
                        ),
                      )),

                      SizedBox(height: 12.h),

                      PHAText(
                        text: 'Your PSID has been generated successfully. You can copy and use it to make a payment without visiting a branch through Internet Banking, ATMs, Mobile Banking (JazzCash, Easypaisa, etc.), or OTC (Over-the-Counter) at any branch of scheduled banks in Pakistan. You will receive a confirmation SMS once the payment is made.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.justify,
                      ),

                      SizedBox(height: 12.h),

                      PHAText(
                        text: 'آپ کا پی ایس آئی ڈی کامیابی کے ساتھ تیار ہو گیا ہے۔ آپ پاکستان میں شیڈول بینکوں کی کسی بھی برانچ میں انٹرنیٹ بینکنگ، اے ٹی ایم، موبائل بینکنگ (جاز کیش، ایزی پیسہ، وغیرہ) یا OTC (اوور دی کاؤنٹر) کے ذریعے برانچ کا دورہ کیے بغیر ادائیگی کرنے کے لیے اسے کاپی کر کے استعمال کر سکتے ہیں۔ ادائیگی کے بعد آپ کو ایک تصدیقی ایس ایم ایس موصول ہوگا۔',
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
                          PHAButton(
                            title: 'Download Bank Slip',
                            filledColor: AppColors.secondary,
                            onTap: () => controller.downloadPDF,
                          ),
                          SizedBox(height: 20),
                          PHAButton(
                            title: 'Cancel / منسوخ کریں',
                            filledColor: AppColors.lightGray_1,
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
