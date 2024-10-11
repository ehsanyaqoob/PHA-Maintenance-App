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
      backgroundColor: AppColors.AppSecondary,
      body: Stack(
        children: [
           // Background Logo
          Positioned.fill(
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                 Container(
                          height: 140.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/png/logo.png',
                            width: 140.w,
                            height: 140.h,
                            color: AppColors.AppPrimary,
                          ),
                        ),
                PHAText(
                  text: 'PHAF Maintenance Service',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
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
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.AppPrimary, AppColors.AppPrimary,],
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
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
          const SizedBox(height: 8),
          PHAText(
            text: label,
            fontSize: 14.sp,
        
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
