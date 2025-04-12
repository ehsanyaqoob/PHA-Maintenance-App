import 'package:pharesidence/Entities/paymnent_status_model.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentStatusController extends GetxController {
  var api = ApiService();
  var isBusy = false.obs;
  var paymentStatus = ''.obs;

  var txtSearch = TextEditingController();

  getPaymentStatus()async{



    if(txtSearch.text.isEmpty){
      Fluttertoast.showToast(msg: 'E-Ticket required');
      return;
    }
    isBusy.value = true;


    if (!await InternetConnectionChecker().hasConnection) {
      throw NetworkException('No Internet Connection');
    }

    var _header = {
      'Content-Type' : 'application/json',
    };
    final response = await http.post(
      Uri.parse('${Config.pro_base_url}${EndPoints.paymentStatus}'),
      headers: _header,
      body: json.encode({'psid': txtSearch.text}),
    );

    if (response.statusCode == 200 || response.statusCode == 404 || response.statusCode == 400) {
      final Map<String, dynamic> data = json.decode(response.body);
      var model =  PaymentStatusModel.fromJson(data);
      isBusy.value = false;
      if(model.status == true){

        paymentStatus.value = model.data?.status ?? 'Unpaid';
        Get.dialog(
            barrierDismissible: true,
            Dialog(
              backgroundColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightGray_1.withOpacity(0.85),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: AppColors.white,
                                child: Icon(Icons.check, size: 45, color: AppColors.primary),
                              ),

                              SizedBox(height: 8.h),

                              PHAText(
                                  text: 'Payment Status',
                                  textAlign: TextAlign.center,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp
                              ),


                            ],
                          ),
                        ),

                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              PHAText(
                                  text: '${model.data?.status ?? ''}',
                                  textAlign: TextAlign.center,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp
                              ),

                              SizedBox(height: 4.h),

                              PHAText(
                                  text: 'Thank You',
                                  textAlign: TextAlign.center,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp
                              ),

                              SizedBox(height: 24.h),

                              PHAText(
                                  text: 'PSID',
                                  textAlign: TextAlign.center,
                                  color: AppColors.blackGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp
                              ),

                              PHAText(
                                  text: '${model.data?.psid ?? ''}',
                                  textAlign: TextAlign.center,
                                  color: AppColors.lightGray_1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp
                              ),

                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            )
        );
      }else{
        Fluttertoast.showToast(msg: '${model.message}');
      }

    } else {
      throw NetworkException('Internal Server Error');
    }



    // try {
    //   ApiResponse<PaymentStatusModel> response =
    //   await api.post(EndPoints.paymentStatus, {'psid': txtSearch.text}, false, (json) {
    //     return json;
    //   });
    //   if (response.success == true) {
    //
    //     paymentStatus.value = response.data?.status ?? 'Unpaid';
    //
    //     return;
    //
    //
    //
    //   }
    // } catch (e) {
    //   Fluttertoast.showToast(msg: '$e');
    // } finally {
    //   isBusy.value = false;
    // }
  }
}