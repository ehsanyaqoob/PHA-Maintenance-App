import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        backgroundColor: AppColors.secondary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PHAText(
                text: 'Privacy Policy',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              SizedBox(height: 16),
              PHAText(
                text:
                    'Your privacy is important to us. Below is an explanation of how we handle user data and protect your information.',
                fontSize: 18,
                color: AppColors.primary,
              ),
              SizedBox(height: 30),
              _buildSectionHeader(
                title: 'User Data',
                icon: Icons.person_outline,
              ),
              PHAText(
                text:
                    'We collect and manage user data to provide a better service. This includes details such as your device information, usage data, and more.',
                fontSize: 16,
                color: AppColors.primary,
              ),
              SizedBox(height: 24),
              _buildSectionHeader(
                title: 'Data Security',
                icon: Icons.security,
              ),
              PHAText(
                text:
                    'We employ various security measures to ensure your data is protected. We also comply with industry standards for data security.',
                fontSize: 16,
                color: AppColors.primary,
              ),
              SizedBox(height: 24),
              Divider(
                color: AppColors.primary.withOpacity(0.4),
                thickness: 1,
              ),
              SizedBox(height: 20),
              PHAText(
                text: 'For any inquiries, please contact our support team.',
                fontSize: 16,
                color: AppColors.primary,
              ),
              SizedBox(height: 24),
              PHAText(
                text: 'This Privacy Policy is subject to change.',
                fontSize: 14,
                color: AppColors.primary.withOpacity(0.6),
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
          color: AppColors.primary,
          size: 24,
        ),
        SizedBox(width: 8),
        PHAText(
          text: title,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
