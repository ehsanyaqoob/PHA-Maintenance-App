import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Payemnts/payment_tab.dart';
import 'package:pharesidence/features/Views/GenerateBill/generate_bill_preview.dart';
import '../../../Generic_Widgets/Widgets/bottm_sheet.dart';
import '../../../Shared/Controllers.dart/maintannace_bill_controller.dart';

class MaintenanceDetailsView extends StatelessWidget {
  final MaintenanceDetailsController controller =
      Get.put(MaintenanceDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Kuri Road',
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Logo
          Positioned.fill(
            child: Image.asset(
              'assets/png/back.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PHAText(
                  text: "Kurri Road",
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
                PHAText(
                  text: "Maintenance Details.",
                  fontSize: 20.sp,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(() => Column(
                          children: [
                            PHAButton(
                              title: 'Additional info',
                              fillColor: false,
                              topMargin: 20.0,
                              onTap: () {
                                controller.toggleInfo();
                              },
                            ),
                            if (controller.isExpanded.value) ...[
                              SizedBox(height: 10.h),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 400.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.AppSecondary,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.AppPrimary.withOpacity(
                                            0.85),
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DataTable(
                                        columns: [
                                          DataColumn(
                                              label: PHAText(
                                                  text: 'Field',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp)),
                                          DataColumn(
                                              label: PHAText(
                                                  text: 'Details',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp)),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Apartment Name',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text:
                                                    'H.No 16-C, St.No.2, Kurri road',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Owner Name',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: 'MR. NAFASAT RAZA',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Category',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: 'Residential',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Consumer ID',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: '1234567890',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Bill Number',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: '9876543210',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Billing Period',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: 'June 2024',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Issue Date',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: '01-June-2024',
                                                fontSize: 16.sp)),
                                          ]),
                                          DataRow(cells: [
                                            DataCell(PHAText(
                                                text: 'Due Date',
                                                fontSize: 16.sp)),
                                            DataCell(PHAText(
                                                text: '08-July-2024',
                                                fontSize: 16.sp)),
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        )),
                  ),
                ),
                PHAButton(
                  title: 'Pay',
                  fillColor: true,
                  topMargin: 20.0,
                  onTap: () {
                    // Add functionality for pay
                    Get.to(PaymentViews());
                  },
                ),
                PHAButton(
                  title: 'Generate Bill', 
                  fillColor: true,
                  topMargin: 20.0,
                  onTap: () {
                   // Get.to(BillPreviewView(psid: '',));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
