import 'package:get/get_navigation/get_navigation.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/residence_view.dart/residence_view.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  final OtpTimerController otpTimerController = Get.put(OtpTimerController()); // Initialize the controller

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        elevation: 0,
        onLeadingPressed: () {
          Get.back();
        },
        backgroundColor: AppColors.AppSecondary,
        title: 'OTP',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PHAText(
                text: 'OTP Code Verification 🔑',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 30),
              PHAText(
                text:
                    'Please enter the OTP code that has been sent to your entered mobile number 0********0 or email. Enter the code below to verify.',
                fontSize: 16,
              ),
              SizedBox(height: 20),
              Obx(() {
                return PHAText(
                  text:
                      'Resend OTP in: ${otpTimerController.secondsRemaining.value} seconds',
                  fontSize: 16,
                  color: AppColors.appRed, 
                );
              }),
              SizedBox(height: 20),
              PHAText(text: 'OTP Fields', fontSize: 20),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return OTPInputField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    nextFocusNode: index < 5 ? _focusNodes[index + 1] : null,
                    previousFocusNode:
                        index > 0 ? _focusNodes[index - 1] : null,
                    autoFocus: index == 0,
                  );
                }),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: PHAButton(
                      title: 'Continue',
                      onTap: () {
                    // Get.to(ResidenceView());
                        // You can add logic to verify OTP and proceed
                      },
                      topMargin: 30.0,
                      fillColor: true,
                    ),
                  ),
                                SizedBox(width: 10),
 Expanded(
                    child: PHAButton(
                      title: 'Resend',
                      onTap: () {
                   //  Get.to(ResidenceView());
                        // You can add logic to verify OTP and proceed
                      },
                      topMargin: 30.0,
                      fillColor: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode?
      previousFocusNode; // Add a previousFocusNode for backward focus

  OTPInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode, // Initialize the previousFocusNode
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.appBlack,
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.greycolor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.AppPrimary, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            focusNode.unfocus();
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          } else {
            if (previousFocusNode != null) {
              FocusScope.of(context).requestFocus(previousFocusNode);
            }
          }
        },
      ),
    );
  }
}
