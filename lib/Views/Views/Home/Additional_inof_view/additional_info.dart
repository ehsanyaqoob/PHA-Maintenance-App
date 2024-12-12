import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/GenerateBill/generate_bill_preview.dart';

class AdditionalDetailView extends StatefulWidget {
  String membershipID;
  AdditionalDetailView({required this.membershipID});
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
      controller.fetchAdditionalInfo(membershipNo: widget.membershipID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppBackground(),
            AppBackButton(title: 'Property Details'),
            Positioned(
              top: 0 + 35.h + 24,
              left: 26,
              right: 26,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PHAText(
                        text:
                            '${controller.additionalInfo.value.projectName ?? ''}',
                        color: AppColors.blackGray,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                    PHAText(
                        text: AppConstants.maintenanceDetails,
                        color: AppColors.blackGray,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                    SizedBox(height: 12.h),
                    Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                          color: AppColors.lightGray_2.withOpacity(0.5),
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: AppColors.lightGray_1, width: 1.5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PHAText(
                              text: '  ${AppConstants.additionalInfo}',
                              color: AppColors.blackGray,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      height: 45.h,
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 12.w),
                          Expanded(
                            child: PHAText(
                                text: 'Field',
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          ),
                          Expanded(
                            flex: 2,
                            child: PHAText(
                                text: 'Details',
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                    Obx(() {
                      return Column(
                        children: [
                          AdditionalInfoItem(
                              title: 'House No',
                              description:
                                  controller.additionalInfo.value.houseNo ??
                                      ''),
                          AdditionalInfoItem(
                              title: 'Lane No',
                              description:
                                  controller.additionalInfo.value.laneNo ?? ''),
                          AdditionalInfoItem(
                              title: 'Category',
                              description:
                                  controller.additionalInfo.value.category ??
                                      ''),
                          AdditionalInfoItem(
                              title: 'Cell',
                              description:
                                  controller.additionalInfo.value.cell ?? ''),
                          AdditionalInfoItem(
                              title: 'Status',
                              description:
                                  controller.additionalInfo.value.status ?? ''),
                          AdditionalInfoItem(
                              title: 'Maintenance Charges',
                              description:
                                  controller.additionalInfo.value.amount ?? ''),
                          AdditionalInfoItem(
                              title: 'Late Fee',
                              description:
                                  controller.additionalInfo.value.lateFee ??
                                      ''),
                          AdditionalInfoItem(
                              title: 'Issue Date',
                              description:
                                  controller.additionalInfo.value?.issueDate?.formatDate() ??
                                      ''),
                          AdditionalInfoItem(
                              title: 'Due Date',
                              description:
                                  controller.additionalInfo.value?.dueDate?.formatDate() ??
                                      ''),
                          AdditionalInfoItem(
                              title: 'Total Amount Due',
                              description: controller
                                      .additionalInfo.value.totalAmountDue ??
                                  ''),
                        ],
                      );
                    }),
                    Obx(() {
                      return Column(
                        children: [
                          SizedBox(height: 12.h),
                          PHARadioButton(
                            items: ['Pay full', 'Pay Partial'],
                            selectedValue:
                                controller.selectedPaymentOption.value,
                            onSelected: (value) {
                              controller.setPaymentOption(value);
                            },
                          ),
                          SizedBox(height: 20),
                          PHATextFormField(
                            hint: 'Enter paid amount',
                            controller: controller.fullAmountController,
                            inputType: TextInputType.number,
                            readOnly: controller.selectedPaymentOption.value ==
                                    'Pay full'
                                ? true
                                : false,
                          ),
                          SizedBox(height: 12.h),
                        ],
                      );
                    }),
                    PHAButton(
                      title: 'Generate Bill',
                      onTap: () {
                        if (controller.fullAmountController.text
                                .replaceAll(',', '') ==
                            '') {
                          Get.snackbar('Error', 'Partial payment is required', colorText: AppColors.white,
                              backgroundColor: AppColors.red.withOpacity(0.8));
                          return;
                        } else if (int.parse(controller
                                .fullAmountController.text
                                .replaceAll(',', '')) >
                            int.parse(controller
                                    .additionalInfo.value.totalAmountDue
                                    ?.replaceAll(',', '') ??
                                '0')) {
                          Get.snackbar('Error',
                              'Partial amount less or equal to paid amount', colorText: AppColors.white,
                              backgroundColor: AppColors.red.withOpacity(0.8));
                          return;
                        }
                        Get.to(GenerateBillPreviewView(
                            membershipID: widget.membershipID));
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
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
