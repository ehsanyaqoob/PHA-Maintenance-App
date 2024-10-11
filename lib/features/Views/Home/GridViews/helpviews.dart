import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';

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
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children:[
          Positioned.fill(
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PHAText(
                  text: 'How can we assist you?',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                 
                ),
                
               
                    SizedBox(height: 20.h,),
                // List of Help Topics
                _buildHelpCard('Frequently Asked Questions', Icons.question_answer, () {
                  // Navigate to FAQ page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Contact Support', Icons.support_agent, () {
                  // Navigate to Contact Support page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Report an Issue', Icons.report_problem, () {
                  // Navigate to Report Issue page
                }),
                SizedBox(height: 15.h),
                _buildHelpCard('Feedback', Icons.feedback, () {
                  // Navigate to Feedback page
                }),
              ],
            ),
          ),
      ]),
    );
  }

  Widget _buildHelpCard(String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
gradient: LinearGradient(
            colors: [AppColors.servicecards, AppColors.CardColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.AppPrimary.withOpacity(0.3),
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(15.0),
        leading: Icon(icon, size: 60, color: AppColors.appWhite),
        title: PHAText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.appWhite,
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.appWhite),
      ),
    );
  }
}
