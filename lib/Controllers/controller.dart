import 'package:get/get.dart';
import'package:pharesidence/Utils/exports/exports.dart';
// import 'package:pharesidence/Shared/Controllers.dart/profile_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Checkbox state variables
bool rememberMe = false;
bool isSigningUp = false;

// Observable variables
var isSignedIn = false.obs;
var isLoading = false.obs;

/// Controller for signup view
bool isPasswordVisible = false;
bool isNewPasswordVisible = false;
bool isConfirmPasswordVisible = false;

final TextEditingController searchController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController CnicController = TextEditingController();
final TextEditingController resetEmailController = TextEditingController();
final TextEditingController resetPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmNewPasswordController = TextEditingController();
// final ProfileController controller = Get.put(ProfileController());

  // TextEditing Controllers for Sign in  //
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
class AuthController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _db = FirebaseFirestore.instance;
  // var isSignedIn = false.obs; 
  var isLoading = false.obs; 
  // Controllers

  // State variables
  bool isPasswordVisible = false;
  bool rememberMe = false;
  bool isSigningUp = false;
  // // Sign-up method
  // Future<void> signUp(String email, String password, String name) async {
  //   try {
  //     isLoading.value = true; // Start loading
  //     // Create user with email and password
  //     UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     String userId = userCredential.user!.uid;
  //     // Save user data to Firestore
  //     await _db.collection('SignUpUsers').doc(userId).set({
  //       'email': email,
  //       'name': name,
  //     });
  //     // Update sign-in status and save locally
  //     await _updateSignInStatus(true);
  //     // Show success snackbar
  //     _showSnackbar(
  //       title: "Sign Up Success",
  //       message: "Account created successfully",
  //       color: AppColors.AppPrimary,
  //     );
  //     // Navigate to the NavigationMenuView
  //     Get.offAll(() => NaviagtionMenuView());
  //   } on FirebaseAuthException catch (e) {
  //     _handleAuthException(e, "Sign Up Failed");
  //   } catch (e) {
  //     _handleGeneralError();
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // // Sign-in method
  // Future<void> signIn(String email, String password) async {
  //   try {
  //     isLoading.value = true;
  //     // Sign in with email and password
  //     await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     // Update sign-in status and save locally
  //     await _updateSignInStatus(true);
  //     _showSnackbar(
  //       title: "Sign In Success",
  //       message: "Logged in successfully",
  //       color: AppColors.AppPrimary,
  //     );
  //     // Navigate to the NavigationMenuView
  //     Get.offAll(() => NaviagtionMenuView());
  //   } on FirebaseAuthException catch (e) {
  //     _handleAuthException(e, "Sign In Failed");
  //   } catch (e) {
  //     _handleGeneralError();
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // Sign-out method
  //
  // // Sign-out method
  // Future<void> signOut() async {
  //   try {
  //     isLoading.value = true; // Start loading

  //     // Sign out the user from Firebase
  //     //await _auth.signOut();

  //     // Clear sign-in status locally
  //     isSignedIn.value = false;
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setBool('isLoggedIn', false); // Set isLoggedIn to false

  //     // Show sign out success message
  //     Get.snackbar(
  //       "Sign Out Success",
  //       "You have successfully signed out.",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: AppColors.AppPrimary,
  //       colorText: Colors.white,
  //     );

  //     // Navigate to the SignInView (or Get Started View)
  //    // Get.offAll(() => SignInView());
  //   } catch (e) {
  //     // Handle any errors that occur during sign-out
  //     Get.snackbar(
  //       "Sign Out Failed",
  //       "An error occurred while signing out.",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   } finally {
  //     isLoading.value = false; // End loading
  //   }
  // }

 
  //// Helper methods
  Future<void> _updateSignInStatus(bool status) async {
    isSignedIn.value = status;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
  }

  void _showSnackbar({
    required String title,
    required String message,
    required Color color,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: Colors.white,
    );
  }
}


class SignUpController extends GetxController {
  // Text controllers for the form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Visibility state for password field
  var isPasswordVisible = false.obs;

  // Remember me checkbox state
  var rememberMe = false.obs;

  // Clean up the controllers when not needed
  @override
  void onClose() {
    nameController.dispose();
    cnicController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to toggle "Remember Me" checkbox
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
}



/// OTP Controller class 
/// import 'package:get/get.dart';

class OtpTimerController extends GetxController {
  RxInt secondsRemaining = 60.obs; // Countdown from 60 seconds
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        // Perform action when timer expires (e.g., re-send OTP)
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 60;
    _timer?.cancel();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}


class PakistaniPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ensure the number does not exceed 11 digits
    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }

    // Format the phone number: 03##-#######
    if (newText.length >= 4) {
      newText = newText.substring(0, 4) + '-' + newText.substring(4);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


class CNICInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Format the CNIC: #####-#######-#
    if (newText.length > 5) {
      newText = newText.substring(0, 5) + '-' + newText.substring(5);
    }
    if (newText.length > 13) {
      newText = newText.substring(0, 13) + '-' + newText.substring(13, 14);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
