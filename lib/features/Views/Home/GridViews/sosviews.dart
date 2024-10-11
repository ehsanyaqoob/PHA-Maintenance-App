import 'package:flutter/material.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

class SoSViews extends StatefulWidget {
  const SoSViews({super.key});

  @override
  State<SoSViews> createState() => _SoSViewsState();
}

class _SoSViewsState extends State<SoSViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SOS Services',
        centerTitle: false,
      ),
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/png/back.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: PHAText(
                    text: "Emergency Contacts",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Emergency Contact List
                Column(
                  children: [
                    _buildContactCard("Police", Icons.security, "100"),
                    _buildContactCard("Fire Brigade", Icons.fire_extinguisher, "101"),
                    _buildContactCard("Ambulance", Icons.local_hospital, "102"),
                    _buildContactCard("Local Hospital", Icons.local_hospital, "103"),
                    _buildContactCard("Civil Defense", Icons.warning, "104"),
                  ],
                ),
                SizedBox(height: 30.h),
                // Emergency Button Section
                Center(
                  child: PHAButton(
                    title: 'SOS System Alert',
                    onTap: () {
                      // Handle SOS button press
                      print('SOS Alert Button Pressed');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Contact Card Widget
  Widget _buildContactCard(String title, IconData icon, String number) {
    return Container(
height: 60.h,
      margin: EdgeInsets.only(bottom: 10), // Adds space between cards
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.servicecards, AppColors.CardColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.AppPrimary.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: AppColors.appWhite),
        title: PHAText(
         text:  title, color: AppColors.AppSecondary,
         fontSize: 18.sp, fontWeight: FontWeight.w600
        ),
        trailing: PHAText(
        text:   number,
        color: AppColors.AppSecondary,
          fontSize: 16.sp, fontWeight: FontWeight.bold
        ),
        onTap: () {
          // Handle contact action, like making a call
          print('Tapped on $title');
        },
      ),
    );
  }
}
