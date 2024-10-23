import 'package:pharesidence/exports/exports.dart';


class PrivacyPolicyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary,
      appBar: CustomAppBar(
        title:'Privacy Policy',
        backgroundColor: AppColors.AppSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Here is where the privacy policy will be displayed. You can add the full text of your privacy policy here.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'User Data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Explain how user data is collected and managed...',
                style: TextStyle(fontSize: 16),
              ),
              // More policy content here...
            ],
          ),
        ),
      ),
    );
  }
}
