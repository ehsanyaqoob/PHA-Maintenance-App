import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Api_Providers/Api_Responses/api_urls.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/GenerateBill/generate_bill_preview.dart';

class PaymentViews extends StatefulWidget {
  const PaymentViews({super.key});

  @override
  State<PaymentViews> createState() => _PaymentViewsState();
}

class _PaymentViewsState extends State<PaymentViews> {

  final controller = Get.find<PropertyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AppBackground(),
            AppBackButton(title: 'Payment Methods'),
            Positioned(
              top: 0 + 35.h + 24,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: PHAText(
                        text: "Select Payment Method",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Payment Method List
                    Column(
                      children: [
                        _buildPaymentCard("Bank Transfer", 'assets/png/bank.png',
                                () => controller.generatePayFastLink()),
                        _buildPaymentCard("1 Bill", 'assets/png/cash.png', (){}),
                        _buildPaymentCard(
                            "Credit/Debit Card", 'assets/png/card.png', (){}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Payment Method Card Widget
  Widget _buildPaymentCard(String title, String iconPath, VoidCallback onTap) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
          title: PHAText(
            text: title,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
          onTap: onTap,
        ),
      ),
    );
  }
}
