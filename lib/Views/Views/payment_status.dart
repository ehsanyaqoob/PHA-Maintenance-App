import 'package:pharesidence/Controllers/paymentStatusController.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class PaymentVerification extends StatefulWidget {
  const PaymentVerification({super.key});

  @override
  State<PaymentVerification> createState() => _PaymentVerificationState();
}

class _PaymentVerificationState extends State<PaymentVerification> {

  var controller = Get.put(PaymentStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
        
            AppBackButton(title: 'Payment Status'),
            Positioned(
              top: 0 + 35.h + 36,
              left: 12,
              right: 12,
              bottom: 0,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        
                    PHAText(
                        text: 'Need Confirmation?',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp
                    ),

                    SizedBox(height: 4.h),
        
                    PHAText(
                        text: 'Check status of your payment by entering PSID below:-',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp
                    ),
        
                    SizedBox(height: 8.h),
        
                    PHATextFormField(
                      title: '',
                      hint: 'Enter PSID',
                      controller: controller.txtSearch,
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onSearch: () => controller.getPaymentStatus(),
                    ),
                  ],
                ),
              ),
            ),
        
            Obx((){
              return controller.isBusy.value ? const PHALoader() : Container();
            })
          ],
        ),
      ),
    );
  }
}
