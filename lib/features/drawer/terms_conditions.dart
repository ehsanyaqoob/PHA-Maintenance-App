import 'package:pharesidence/exports/exports.dart';
import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title:'Terms & Cinditions ',
        backgroundColor: AppColors.AppSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Here are the terms and conditions. Make sure to explain them clearly for users.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Usage Rules',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Define how the app should be used...',
                style: TextStyle(fontSize: 16),
              ),
              // More terms here...
            ],
          ),
        ),
      ),
    );
  }
}
