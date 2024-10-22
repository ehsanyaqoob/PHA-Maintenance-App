import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:flutter/material.dart';

class RateUsView extends StatefulWidget {
  @override
  _RateUsViewState createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  double _rating = 3.0; // Default rating

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title:'Rate Us',
        backgroundColor: AppColors.AppSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PHAText(
             text:  'How was your experience?',
            fontSize: 22, fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _rating = index + 1.0; 
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.amber : Colors.grey, 
                    size: 40,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            PHAButton(
              title: 'Rate Now',
              fillColor: true,
              onTap: () {
                  showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const PHALoader();
              },
            );
               // print('Rating submitted: $_rating');
              },
            ),
          ],
        ),
      ),
    );
  }
}
