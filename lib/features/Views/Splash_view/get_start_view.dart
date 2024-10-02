import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_button.dart'; // Import your custom button
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
          // Gradient background for a modern feel
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF42A5F5)], // Blue gradient
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
                
                // Welcome Text with enhanced style
                PHAText(
                  text: 'Welcome To Digital\nPHA Residencia\nMaintenance Service',
                  fontSize: 30.sp, // Larger font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White color for better contrast
                  textAlign: TextAlign.center,
                  letterSpacing: 1.2, // Slight letter spacing for a polished look
                ),
                
                const Spacer(),

                // Sign In button with custom PHAButton
                PHAButton(
                  title: 'Sign In',
                  onTap: () {
                    // Handle Sign In logic
                                        Get.to(SignInView());

                  },
                 
                ),
                
                const SizedBox(height: 16),

                // Sign Up button with custom PHAButton
                PHAButton(
                  title: 'Sign Up',
                  onTap: () {
                    // Handle Sign Up navigation
                    Get.to(SignUpView());
                  },
                
                ),
                
                const SizedBox(height: 12),
                
                // "Don't have membership?" text with subtle animation
                GestureDetector(
                  onTap: () {
                    // Handle Sign Up navigation
                  },
                  child: PHAText(
                    text: "Don't have membership?",
                    fontSize: 16.sp,
                    color: Colors.white70, // Slight transparency for subtlety
                    textAlign: TextAlign.center,
                  ),
                ),

                const Spacer(),
                
                // Bottom row of buttons/icons with enhanced look
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon 1 (e.g., News/Events) with a gradient effect
                    _buildBottomIcon(
                      icon: Icons.event,
                      label: 'News/Events',
                      onTap: () {
                        // Handle News/Events tap
                      },
                    ),
                    // Icon 2 (e.g., Projects)
                    _buildBottomIcon(
                      icon: Icons.business,
                      label: 'Projects',
                      onTap: () {
                        // Handle Projects tap
                      },
                    ),
                    // Icon 3 (e.g., Contact)
                    _buildBottomIcon(
                      icon: Icons.phone,
                      label: 'Contact',
                      onTap: () {
                        // Handle Contact tap
                      },
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

  // Helper method to build bottom row icons
  Widget _buildBottomIcon({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF42A5F5), Color(0xFF0D47A1)], // Gradient for icons
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
            color: Colors.white70, // Semi-transparent white for text
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
