import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class SignUpController extends GetxController {
  var api = ApiService();
  var isBusy = false.obs;

  var name = ''.obs;
  var cnic = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  onNameChange(String value) {
    name.value = value;
    // isCNICValid = true.obs;
  }

  onCNICChange(String value) {
    cnic.value = value;
    // isCNICValid = true.obs;
  }

  onPhoneChange(String value) {
    phone.value = value;
    // isPhoneValid.value = true;
  }

  onEmailChange(String value) {
    email.value = value;
    // isPhoneValid.value = true;
  }

  onPasswordChange(String value) {
    password.value = value;
    // isPhoneValid.value = true;
  }

  bool get isValidate {
    return name.value.isNotEmpty ||
        cnic.value.isNotEmpty ||
        phone.value.isNotEmpty ||
        email.value.isNotEmpty ||
        password.value.isNotEmpty;
  }

  signUpService() async {

    if(!isValidate){
      Fluttertoast.showToast(msg: 'All fields are required');
      return;
    }

    isBusy.value = true;
    try {
      Map<String, dynamic> param = {
        "cnic": cnic.value,
        "phone_no": phone.value.replaceAll('-', ''),
        "name": name.value,
        "email": email.value,
        "password": password.value
      };
      ApiResponse<SignInModel> signup =
          await api.post(EndPoints.signup, param, false, (json) {
        return SignInModel.fromJson(json);
      });
      if (signup.success) {
        Get.offAll(SignInView());
      } else {
        Fluttertoast.showToast(msg: signup.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      isBusy.value = false;
    }
  }
}
