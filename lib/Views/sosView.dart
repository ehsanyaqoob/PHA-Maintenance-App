import 'package:flutter/material.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class SoSView extends StatefulWidget {
  const SoSView({super.key});

  @override
  State<SoSView> createState() => _SoSViewState();
}

class _SoSViewState extends State<SoSView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'SOS Services',
        centerTitle: false,
      ),
      body: Stack(
        children: [

          AppBackground(),

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
          colors: [AppColors.primary, AppColors.secondary],
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
          leading: Icon(icon, size: 40, color: AppColors.white),
          title: PHAText(
           text:  title, color: AppColors.white,
           fontSize: 18.sp, fontWeight: FontWeight.w600
          ),
          trailing: PHAText(
          text:   number,
          color: AppColors.white,
            fontSize: 16.sp, fontWeight: FontWeight.bold
          ),
          onTap: () {
            // Handle contact action, like making a call
            print('Tapped on $title');
          },
        ),
      ),
    );
  }
}
