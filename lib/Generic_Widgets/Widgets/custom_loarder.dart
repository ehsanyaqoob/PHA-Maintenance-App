import 'package:pharesidence/exports/exports.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PHALoader extends StatelessWidget {
  const PHALoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffD8AF69)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Static method to show the loader
  static void show() {
    Get.dialog(
      const PHALoader(),
      barrierDismissible: false, // Prevent dismissing the loader by tapping outside
    );
  }

  // Static method to hide the loader
  static void hide() {
    if (Get.isDialogOpen == true) {
      Get.back(); // Close the loader dialog
    }
  }
}
