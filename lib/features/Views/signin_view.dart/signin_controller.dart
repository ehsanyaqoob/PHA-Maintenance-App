import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class SinginController extends GetxController{

  //var api = ApiService();
  var isBusy = false.obs;
  var cnic = ''.obs;
  var phone = ''.obs;
  var isCNICValid = true.obs;
  var isPhoneValid = true.obs;
  RxBool isLoading = false.obs; 
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
      //loginService();
    }
  }

  // loginService() async {
  //   isBusy.value = true;
  //   try {
  //     Map<String, dynamic> param = {
  //       "cnic": cnic.value,
  //       "mobile_no": phone.value.replaceAll('-', ''),
  //     };
  //     ApiResponse<SigninModel> login = await api.post(EndPoints.login, param, false, (json) {
  //       return SigninModel.fromJson(json);
  //     });
  //     if (login.success) {
  //       await Storage.saveCNIC(cnic: login.data?.cnic ?? '');
  //       await Storage.saveAuthToken(token: login.data?.token ?? '');
  //       //Get.to(HomeView());
  //     }else{
  //       Fluttertoast.showToast(msg: login.message);
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: '$e');
  //   }finally{
  //     isBusy.value = false;
  //   }
  // }
}