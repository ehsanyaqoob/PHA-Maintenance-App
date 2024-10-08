import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/signin_view.dart/signin_view.dart';
import 'package:pharesidence/features/Views/signup_view.dart/signup_view.dart';

class GetStartView extends StatefulWidget {
  const GetStartView({super.key});

  @override
  State<GetStartView> createState() => _GetStartViewState();
}

class _GetStartViewState extends State<GetStartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColors.AppPrimary, const Color(0xFF16213E)], // Dark primary and secondary colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                PHAText(
                  text: 'PHA Residencia\nMaintenance Service',
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  letterSpacing: 1.5,
                ),
                const Spacer(),
                PHAButton(
                  title: 'Sign In',
                  onTap: () {
                    Get.to(SignInView());
                  },
                
                ),
                const SizedBox(height: 16),
                PHAButton(
                  title: 'Sign Up',
                  onTap: () {
                    Get.to(SignUpView());
                  },
                  
               
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: PHAText(
                    text: "Don't have membership?",
                    fontSize: 16.sp,
                    color: Colors.white70,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomIcon(
                      icon: Icons.event,
                      label: 'News/Events',
                      onTap: () {},
                    ),
                    _buildBottomIcon(
                      icon: Icons.business,
                      label: 'Projects',
                      onTap: () {},
                    ),
                    _buildBottomIcon(
                      icon: Icons.phone,
                      label: 'Contact',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomIcon({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF42A5F5), Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Icon(icon, color: Colors.white, size: 28),
            ),
          ),
          const SizedBox(height: 8),
          PHAText(
            text: label,
            fontSize: 14.sp,
            color: Colors.white70,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
