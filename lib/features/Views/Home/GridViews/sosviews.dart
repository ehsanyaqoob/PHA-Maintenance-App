import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
        title: 'Sos Services',
        centerTitle: false,       
      ),
      backgroundColor: AppColors.AppSecondary,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Emergency Contacts",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.AppPrimary,
                ),
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
              child: PHAButton(title: 'SOS System Alert', )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(String title, IconData icon, String number) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, size: 30, color: AppColors.AppPrimary),
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          number,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Handle contact action (like making a call)
        },
      ),
    );
  }
}
