import 'package:pharesidence/Utils/exports/exports.dart';

class HelpViews extends StatefulWidget {
  const HelpViews({super.key});

  @override
  State<HelpViews> createState() => _HelpViewsState();
}

class _HelpViewsState extends State<HelpViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Help & Support',
        centerTitle: false,
      ),
      body: Stack(
        children: [
          AppBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PHAText(
                  text: 'How can we assist you?',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20.h),
                // List of Help Topics
                _buildHelpCard('Frequently Asked Questions', 'assets/png/faq.png', () {
                  // Navigate to FAQ page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Contact Support', 'assets/png/contact.png', () {
                  // Navigate to Contact Support page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Report an Issue', 'assets/png/issues.png', () {
                  // Navigate to Report Issue page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Feedback', 'assets/png/feedback.png', () {
                  // Navigate to Feedback page
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard(String title, String iconPath, VoidCallback onTap) {
    return Container(
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
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(24.0),
        leading: Image.asset(
          iconPath,
          width: 45.w, // Set the width for the icon
          height: 45.w, // Set the height for the icon
        ),
        title: PHAText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        // trailing: Icon(Icons.arrow_forward_ios, color: AppColors.white),
      ),
    );
  }
}
