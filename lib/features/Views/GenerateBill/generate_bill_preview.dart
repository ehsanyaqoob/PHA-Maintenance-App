import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/models/additionalInfo_model.dart';
import '../../Payemnts/payment_tab.dart';

class GenerateBillPreviewView extends StatefulWidget {
  final String psid;
  final AdditionalInfoData additionalInfo;
  final double? partialAmount;
  final String pdflink;

  GenerateBillPreviewView({
    Key? key,
    required this.psid,
    required this.additionalInfo,
    this.partialAmount,
    required this.pdflink,
  }) : super(key: key);

  @override
  State<GenerateBillPreviewView> createState() =>
      _GenerateBillPreviewViewState();
}

class _GenerateBillPreviewViewState extends State<GenerateBillPreviewView> {
  
  final RxBool isDownloading = false.obs;
  static const platform = MethodChannel('com.example.download/pdf');

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.AppSecondary,
              appBar: CustomAppBar(
                title: 'Bill Preview',
                centerTitle: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PHAText(
                        textAlign: TextAlign.center,
                        text: 'Maintenance Charges Bill',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                      Divider(
                        thickness: 2,
                        color: AppColors.appBlack,
                      ),
                      SizedBox(height: 15),
                      PHAText(
                        textAlign: TextAlign.center,
                        text:
                            'Please make sure that you have copied the \nbelow PSID for making Payments using any method',
                        fontSize: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PHAText(
                            textAlign: TextAlign.center,
                            text: 'PSID: ${widget.psid}',
                            fontWeight: FontWeight.bold,
                            color: AppColors.AppPrimary,
                            fontSize: 16,
                          ),
                          IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: widget.psid));

                              // Show Snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: PHAText(
                                    fontSize: 16,
                                    color: AppColors.AppSecondary,
                                    text: 'PSID has been copied'),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(
                                    bottom: 100.0,
                                    left: 16.0,
                                    right: 16.0,
                                  ),
                                  backgroundColor: AppColors.AppPrimary,
                                ),
                              );
                            },
                            tooltip: 'Copy PSID',
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      PHAText(
                        textAlign: TextAlign.center,
                        text: 'Consumer Information',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      SizedBox(height: 15),
                      GenericDetailsCard(
                        details: [
                          {
                            'label': 'Name',
                            'value': widget.additionalInfo.fullName ?? 'N/A'
                          },
                          {
                            'label': 'Membership No',
                            'value':
                                widget.additionalInfo.registrationNo ?? 'N/A'
                          },
                          {
                            'label': 'CNIC',
                            'value': widget.additionalInfo.cnic ?? 'N/A'
                          },
                          {
                            'label': 'Lane No',
                            'value': widget.additionalInfo.laneNo?.toString() ??
                                'N/A'
                          },
                          {
                            'label': 'House No',
                            'value':
                                widget.additionalInfo.houseNo?.toString() ??
                                    'N/A'
                          },
                          {
                            'label': 'Category',
                            'value': widget.additionalInfo.category ?? 'N/A'
                          },
                          {
                            'label': 'Project',
                            'value': widget.additionalInfo.projectName ?? 'N/A'
                          },
                          {
                            'label': 'Present Address',
                            'value':
                                widget.additionalInfo.presentAddress ?? 'N/A'
                          },
                          {
                            'label': 'Cell',
                            'value': widget.additionalInfo.cell ?? 'N/A'
                          },
                          {
                            'label': 'Status',
                            'value': widget.additionalInfo.status ?? 'N/A'
                          },
                        ],
                      ),
                      SizedBox(height: 15),
                      Divider(thickness: 2, color: AppColors.appBlack),
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
                            'value': widget.additionalInfo.issueDate ?? 'N/A'
                          },
                          {
                            'label': 'Due Date',
                            'value': widget.additionalInfo.dueDate ?? 'N/A'
                          },
                          {
                            'label': 'Maintenance Charges',
                            'value': widget.additionalInfo.amount?.toString() ??
                                'N/A'
                          },
                          {
                            'label': 'Late Payment Charges',
                            'value':
                                widget.additionalInfo.lateFee?.toString() ??
                                    'N/A'
                          },
                          {
                            'label': 'Total Amount Due',
                            'value': widget.additionalInfo.totalAmountDue
                                    ?.toString() ??
                                'N/A'
                          },
                          {
                            'label': 'Partial Amount Due',
                            'value': widget.partialAmount?.toString() ?? 'N/A'
                          },
                        ],
                      ),
                      SizedBox(height: 15),
                      PHAButton(
                        title: 'Pay Now',
                        onTap: () {
                          Get.to(PaymentViews());
                        },
                      ),
                      SizedBox(height: 20),
                      PHAButton(
                        title: 'Print / Download',
                        onTap: () async {
                          await _downloadPdf(widget.pdflink);
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            if (isDownloading.value) Center(child: PHALoader()),
          ],
        ));
  }

Future<void> _downloadPdf(String url) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      print("Storage permission denied");
      return;
    }

    try {
      await platform.invokeMethod('downloadPdf', {
        'url': url,
        'fileName': 'PHA-Bill-${DateTime.now().millisecondsSinceEpoch}.pdf',
      });
      Get.snackbar("Download", "Download started",
          snackPosition: SnackPosition.TOP);
      // print("Download started");
    } catch (e) {
      Get.snackbar("Download", "Error downloading PDF: $e",
          snackPosition: SnackPosition.TOP);
      print("Error downloading PDF: $e");
    }
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.socialGrey.withOpacity(0.85),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: details
              .map((detail) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PHAText(
                            textAlign: TextAlign.center,
                            text: detail['label']!,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            color: AppColors.AppPrimary,
                          ),
                          Expanded(
                            // Ensures text wraps and doesn't overflow
                            child: PHAText(
                              textAlign: TextAlign.end,
                              text: detail['value']!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              fontSize: fontSize,
                              color: AppColors.greycolor,
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 1, color: AppColors.greycolor),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
