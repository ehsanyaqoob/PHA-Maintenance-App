import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/GenerateBill/generate_bill_preview.dart';

class AdditionalDetailView extends StatefulWidget {
  Property property;
  AdditionalDetailView({required this.property});
  @override
  State<AdditionalDetailView> createState() => _AdditionalDetailViewState();
}

class _AdditionalDetailViewState extends State<AdditionalDetailView> {
  final controller = Get.find<PropertyController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      controller.fetchAdditionalInfo(property: widget.property);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppBackground(),
            AppBackButton(title: 'Pay Bill / بل کی ادائیگی'),
            Obx(() => Positioned(
                  top: 0 + 35.h + 24,
                  left: 26,
                  right: 26,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PHAText(
                            text: '${widget.property.projectName ?? ''}',
                            color: AppColors.blackGray,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),
                        // PHAText(
                        //     text: AppConstants.maintenanceDetails,
                        //     color: AppColors.blackGray,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 12.sp),
                        SizedBox(height: 0.h),
                        // Container(
                        //   height: 45.h,
                        //   decoration: BoxDecoration(
                        //       color: AppColors.lightGray_2.withOpacity(0.5),
                        //       border: Border.symmetric(
                        //           horizontal: BorderSide(
                        //               color: AppColors.lightGray_1, width: 1.5))),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       PHAText(
                        //           text: '  ${AppConstants.additionalInfo}',
                        //           color: AppColors.blackGray,
                        //           fontWeight: FontWeight.w600,
                        //           fontSize: 18.sp),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(height: 12.h),
                        // Container(
                        //   height: 45.h,
                        //   decoration: BoxDecoration(
                        //       color: AppColors.secondary,
                        //       borderRadius: BorderRadius.circular(10)),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       SizedBox(width: 12.w),
                        //       Expanded(
                        //         child: PHAText(
                        //             text: 'Field',
                        //             color: AppColors.white,
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 14.sp),
                        //       ),
                        //       Expanded(
                        //         flex: 2,
                        //         child: PHAText(
                        //             text: 'Details',
                        //             color: AppColors.white,
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 14.sp),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        Column(
                          children: [
                            AdditionalInfoItem(
                                title: 'Membership#:',
                                description: controller
                                        .additionalInfo.value.registrationNo ??
                                    ''),

                            AdditionalInfoItem(
                                title: 'Allottee Name:',
                                description:
                                    controller.additionalInfo.value.fullName ??
                                        ''),

                            AdditionalInfoItem(
                                title: 'CNIC:',
                                description:
                                    controller.additionalInfo.value.cnic ?? ''),

                            AdditionalInfoItem(
                                title: 'Mobile#:',
                                description:
                                    controller.additionalInfo.value.cell ?? ''),

                            // AdditionalInfoItem(
                            //     title: 'House No',
                            //     description:
                            //     controller.additionalInfo.value.houseNo ??
                            //         ''),
                            AdditionalInfoItem(
                                title: 'Address:',
                                description:
                                    widget.property.presentAddress ?? ''),

                            AdditionalInfoItem(
                                title: 'Issue Date:',
                                description: controller
                                        .additionalInfo.value.issuedDate
                                        ?.formatDate() ??
                                    ''),
                            AdditionalInfoItem(
                                title: 'Due Date:',
                                description: controller
                                        .additionalInfo.value.dueDate
                                        ?.formatDate() ??
                                    '',
                                textColor: Colors.red),

                            AdditionalInfoItem(
                                title: 'Current Month Charges:',
                                description: controller
                                        .additionalInfo.value.totalAmount
                                        ?.formatAsNumber() ??
                                    ''),
                            AdditionalInfoItem(
                                title: 'Surcharge(s):',
                                description:
                                    '${controller.additionalInfo.value.lateFeeCharges ?? '0'}'),

                            // AdditionalInfoItem(
                            //     title: 'Previous Remaining Bill',
                            //     description:
                            //     '${controller.additionalInfo.value.totalPreviousBill ??
                            //     0}'.formatAsNumber()
                            // ),
                            //
                            // AdditionalInfoItem(
                            //     title: 'Previous Surcharge(s)',
                            //     description:
                            //     '${controller.additionalInfo.value.totalPreviousBillLateFee ??
                            //         '0'}'.formatAsNumber()),

                            AdditionalInfoItem(
                                title: 'Arears:',
                                description:
                                    '${double.parse(controller.additionalInfo.value.arears ?? '0')}'
                                            ?.formatAsNumber() ??
                                        '0'),

                            AdditionalInfoItem(
                                title: 'Partially Paid',
                                description:
                                    '-${controller.additionalInfo.value.paidAmount?.formatAsNumber()}'),

                            AdditionalInfoItem(
                              title: 'Total Amount Due',
                              description:
                              (double.parse('${controller.additionalInfo.value.paidAmount ??
                                  0}') > 0 && double.parse('${controller.additionalInfo.value.arears ??
                                  0}') == 0) ? '0.00' : '${(double.parse(controller.additionalInfo.value.arears ?? '0') + double.parse(controller.additionalInfo.value.remainingAmount ?? '0'))}'
                                      .formatAsNumber(),
                              textColor: Colors.red,
                            ),
                          ],
                        ),

                        !(double.parse('${controller.additionalInfo.value.paidAmount ??
                            0}') > 0 && double.parse('${controller.additionalInfo.value.arears ??
                            0}') == 0)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 12.h),
                                      PHARadioInRow(
                                        items: ['Pay full', 'Pay Partial'],
                                        selectedValue: controller
                                            .selectedPaymentOption.value,
                                        onSelected: (value) {
                                          controller.setPaymentOption(value);
                                        },
                                      ),
                                      SizedBox(height: 20),
                                      PHATextFormField(
                                        hint: 'Enter paid amount',
                                        controller:
                                            controller.fullAmountController,
                                        inputType: TextInputType.number,
                                        readOnly: controller
                                                    .selectedPaymentOption
                                                    .value ==
                                                'Pay full'
                                            ? true
                                            : false,
                                      ),
                                      SizedBox(height: 12.h),
                                    ],
                                  ),
                                  PHAText(
                                    text: 'Payment Through',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Obx(() {
                                    return Column(
                                      children: [
                                        SizedBox(height: 4.h),
                                        PHARadioInColumn(
                                          // items: ['PSID (Bank, ATM or Internet/Mobile Banking)', 'Card (Master/Visa)'],
                                          items: [
                                            'PSID (Bank, ATM or Internet/Mobile Banking)'
                                          ],
                                          selectedValue:
                                              controller.paymentThrough.value,
                                          onSelected: (value) {
                                            controller.setPaymentThrough(value);
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                                  SizedBox(height: 12.h),
                                  PHAButton(
                                    title: 'Proceed / آگے بڑھیں',
                                    filledColor: AppColors.primary,
                                    onTap: () {
                                      if (controller.fullAmountController.text
                                              .replaceAll(',', '') ==
                                          '') {
                                        Get.snackbar('Error',
                                            'Partial payment is required',
                                            colorText: AppColors.white,
                                            backgroundColor:
                                                AppColors.red.withOpacity(0.8));
                                        return;
                                      } else if (double.parse(controller
                                              .fullAmountController.text
                                              .replaceAll(',', '')) >
                                          double.parse(
                                              '${double.parse(controller.additionalInfo.value.arears ?? '0') + double.parse(controller.additionalInfo.value.remainingAmount ?? '0')}'
                                                      ?.replaceAll(',', '') ??
                                                  '0')) {
                                        Get.snackbar('Error',
                                            'Partial amount less or equal to paid amount',
                                            colorText: AppColors.white,
                                            backgroundColor:
                                                AppColors.red.withOpacity(0.8));
                                        return;
                                      }
                                      Get.to(GenerateBillPreviewView(
                                        property:
                                            controller.additionalInfo.value,
                                        amount: controller
                                            .fullAmountController.text,
                                      ));
                                    },
                                  ),
                                  SizedBox(height: 24.h),
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: PHAText(
                                  text: 'PAID',
                                  textAlign: TextAlign.center,
                                  fontSize: 24.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ],
                    ),
                  ),
                )),
            // Align(
            //   alignment: Alignment.center,
            //   child: Obx(() => Visibility(
            //       visible: controller.isBusy!.value, child: PHALoader())),
            // )
          ],
        ),
      ),
    );
  }
}
