import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title: 'Terms & Conditions',
        backgroundColor: AppColors.AppSecondary,
        elevation: 0, // Clean design with no shadow
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PHAText(
                text: 'Terms & Conditions',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.AppPrimary,
              ),
              SizedBox(height: 16),
              PHAText(
                text:
                    'Please read the following terms and conditions carefully. By using this app, you agree to comply with these terms.',
                fontSize: 18,
                color: AppColors.AppPrimary,
              ),
              SizedBox(height: 30),
              _buildSectionHeader(
                title: 'Usage Rules',
                icon: Icons.rule,
              ),
              PHAText(
                text:
                    'This app should be used according to the following rules. Ensure your actions comply with all regulations provided in this document.',
                fontSize: 16,
                color: AppColors.AppPrimary,
              ),
              SizedBox(height: 24),
              _buildSectionHeader(
                title: 'Privacy & Security',
                icon: Icons.lock_outline,
              ),
              PHAText(
                text:
                    'We take your privacy and security seriously. Your personal data will only be used according to our Privacy Policy.',
                fontSize: 16,
                color: AppColors.AppPrimary,
              ),
              SizedBox(height: 24),
              Divider(
                color: AppColors.AppPrimary.withOpacity(0.4),
                thickness: 1,
              ),
              SizedBox(height: 20),
              PHAText(
                text: 'For any questions, please contact our support team.',
                fontSize: 16,
                color: AppColors.AppPrimary,
              ),
              SizedBox(height: 24),
              PHAText(
                text: 'These Terms & Conditions are subject to change.',
                fontSize: 14,
                color: AppColors.AppPrimary.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.AppPrimary,
          size: 24,
        ),
        SizedBox(width: 8),
        PHAText(
          text: title,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.AppPrimary,
        ),
      ],
    );
  }
}
