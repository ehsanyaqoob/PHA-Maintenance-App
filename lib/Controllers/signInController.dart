import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class SignInController extends GetxController {

  var api = ApiService();
  var isBusy = false.obs;
  var cnic = ''.obs;
  var phone = ''.obs;
  var isCNICValid = true.obs;
  var isPhoneValid = true.obs;

  onCNICChange(String value) {
    cnic.value = value;
    isCNICValid = true.obs;
  }

  onPhoneChange(String value) {
    phone.value = value;
    isPhoneValid.value = true;
  }

  bool get validateFields {
    isCNICValid.value = cnic.value.isNotEmpty;
    isPhoneValid.value = phone.value.isNotEmpty;
    return isCNICValid.value && isPhoneValid.value;
  }

  onLoginPress() {
    if (validateFields) {
      loginService();
    }else{
      Fluttertoast.showToast(msg: 'All fields required');
    }
  }

  loginService() async {

    // String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/api_local_responses/signIn.json");
    // final jsonResult = json.decode(data); //latest Dart
    // var login = SignInModel.fromJson(jsonResult);
    // await Storage.saveUser(user: login);
    // await Storage.saveAuthToken(token: login.token ?? '');
    // Get.put(HomeController());
    // Get.to(HomeView());
    // return;


 



    isBusy.value = true;
    try {
      Map<String, dynamic> param = {
        "cnic": cnic.value.replaceAll('-', ''),
        "cell": phone.value.replaceAll('-', ''),
      };
      ApiResponse<SignInModel> login = await api.post(EndPoints.login, param, false, (json) {
        return SignInModel.fromJson(json);
      });
      if (login.success) {
        await Storage.saveUser(user: login.data);
        await Storage.saveAuthToken(token: login.data?.token ?? '');
        Get.put(HomeController());
        Get.to(HomeView());
      }else{
        Fluttertoast.showToast(msg: login.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }finally{
      isBusy.value = false;
    }
  }
}
