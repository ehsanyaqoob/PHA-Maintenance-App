import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharesidence/Utils/Theme/app_colors.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class RateUsView extends StatefulWidget {
  @override
  _RateUsViewState createState() => _RateUsViewState();
}

class _RateUsViewState extends State<RateUsView> {
  double _rating = 0;
  final TextEditingController _feedbackController = TextEditingController();

  // Function to handle the submit action (send the rating and feedback)
  void _submitRating() {
    if (_rating == 0) {
      // Show a message if no rating is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a rating')),
      );
      return;
    }

    // Simulate saving the feedback (could be saving to a database, sending to an API, etc.)
    String feedback = _feedbackController.text.isEmpty
        ? 'No feedback provided.'
        : _feedbackController.text;

    // Print the values or handle them as needed
    print('Rating: $_rating');
    print('Feedback: $feedback');

    // Show success message after submitting
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Thank you for your feedback!')),
    );

    // Optionally, clear the feedback
    _feedbackController.clear();
    setState(() {
      _rating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rate Us',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Rating bar
        PHAText(
            text:  'How would you rate our app?',
             fontSize: 22, fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            // Feedback text field
            PHATextFormField(
              controller: _feedbackController,
           
            
                hint: 'Please provide any feedback or suggestions...',
               
              ),
          
            SizedBox(height: 20),
            // Submit button
           PHAButton(
              onTap: _submitRating,
         title: 'Submit Feedback',
            
           
            
            ),
          ],
        ),
      ),
    );
  }
}
