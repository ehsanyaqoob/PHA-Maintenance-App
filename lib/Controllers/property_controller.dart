import 'package:get/get.dart';
import 'package:pharesidence/Entities/history_model.dart';
import 'package:pharesidence/Entities/member_bill_model.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class PropertyController extends GetxController {
  var api = ApiService();
  var isBusy = false.obs;
  Rx<SignInModel> user = SignInModel().obs;
  var listOfProperties = <Property>[].obs;
  var listOfHistory = <History>[].obs;
  Rx<AdditionalInfoModel> additionalInfo = AdditionalInfoModel().obs;
  Rx<PSIDModel> psidInfo = PSIDModel().obs;
  var membershipNumber = ''.obs;
  Property? properties;
  var selectedPaymentOption = 'Pay full'.obs;
  var paymentThrough = 'PSID (Bank, ATM or Internet/Mobile Banking)'.obs;
  var paidAmount = ''.obs;
  TextEditingController fullAmountController = TextEditingController();

  PropertyController() {
    getUserData();
  }

  getUserData() async {
    user.value = await Storage.getUserInfo();
  }

  @override
  void onClose() {
    fullAmountController.dispose();
    super.onClose();
  }

  onSubmitMembership(String value) async {
    FocusScope.of(Get.context!).unfocus();
    await fetchProjects(cnicOrMembership: value);
  }

  void setPaymentOption(String value) {
    selectedPaymentOption.value = value;
    if (value == 'Pay full') {
      paidAmount.value = '${(double.parse(additionalInfo.value.arears ?? '0') - double.parse(additionalInfo.value.totalAmount ?? '0')) + double.parse(additionalInfo.value.remainingAmount ?? '0') + double.parse(additionalInfo.value.lateFeeCharges ?? '0') - double.parse(additionalInfo.value.paidAmount ?? '0')}';
      fullAmountController.text = paidAmount.value;
    } else if (value == 'Pay Partial') {
      paidAmount.value = '';
      fullAmountController.text = '';
    }
    update();
  }

  void setPaymentThrough(String value) {
    paymentThrough.value = value;
    update();
  }

  fetchProperties() async {
    if (user.value.memberType == 'tenant') {
      return;
    }
    await fetchProjects(cnicOrMembership: user.value.cnic ?? '');
  }

  fetchProjects({required String cnicOrMembership}) async {

    // String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/api_local_responses/getProjects.json");
    // final jsonResult = json.decode(data); //latest Dart
    // var response = PropertyModel.fromJson(jsonResult);
    // var projects = response.projects ?? [];
    // listOfProperties.value = [];
    // listOfProperties.value?.add(projects.last);
    // listOfProperties.refresh();
    // return;

    isBusy.value = true;
    try {
      // Map<String, dynamic> param = {
      //   "cnic": cnicOrMembership,
      //   "memberType": user.value.memberType ?? 'owner'
      // };

      Map<String, dynamic> param = {
        'token': await Storage.authToken
      };

      ApiResponse<PropertyModel> response =
          await api.post(EndPoints.getMemberships, param, false, (json) {
        return PropertyModel.fromJson(json);
      });
      if (response.success) {
        listOfProperties.value = response.data?.projects ?? [];
        listOfProperties.refresh();
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      isBusy.value = false;
    }
  }

  fetchAdditionalInfo({required Property property}) async {

    // String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/api_local_responses/getAdditionalInfoAPI.json");
    // final jsonResult = json.decode(data); //latest Dart
    // var response = AdditionalInfoModel.fromJson(jsonResult);
    // additionalInfo.value = response;
    // properties = property;
    // paidAmount.value = '${property.totalAmountDue}';
    // fullAmountController.text = paidAmount.value;
    // update();
    // return;


    membershipNumber.value = property.registrationNo ?? '';
    isBusy.value = true;
    try {
      // Map<String, dynamic> param = {"registration_no": property.registrationNo};

      Map<String, dynamic> param = {
        'token': await Storage.authToken,
        "member_id": property.memberId
      };

      ApiResponse<AdditionalInfoModel> response = await api
          .post(EndPoints.generateBill, param, false, (json) {
        return AdditionalInfoModel.fromJson(json);
      });
      if (response.success) {
        additionalInfo.value = response.data!;
        paidAmount.value = '${additionalInfo.value.grandTotal}';
        fullAmountController.text = '${(double.parse(additionalInfo.value.arears ?? '0') - double.parse(additionalInfo.value.totalAmount ?? '0')) + double.parse(additionalInfo.value.remainingAmount ?? '0') + double.parse(additionalInfo.value.lateFeeCharges ?? '0') - double.parse(additionalInfo.value.paidAmount ?? '0')}';
        update();
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      isBusy.value = false;
    }
  }

  fetchPSID({required AdditionalInfoModel property}) async {

    // String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/api_local_responses/getPSIDAPI.json");
    // final jsonResult = json.decode(data); //latest Dart
    // var response = PSIDModel.fromJson(jsonResult);
    // psidInfo.value = response;
    // isBusy.value = false;
    // return;

    isBusy.value = true;
    var user = await Storage.getUserInfo();
    // var cnic  = await Storage.cnic;
    try {
      // Map<String, dynamic> param = {
      //   "registration_no": property.registrationNo,
      //   "amount": fullAmountController.text.replaceAll(',', '')
      // };

      Map<String, dynamic> param = {
        'token': await Storage.authToken,
        "registration_no": property.registrationNo,
        "amount": fullAmountController.text.replaceAll(',', '')
      };

      ApiResponse<PSIDModel> response =
          await api.post(EndPoints.getPSID, param, false, (json) {
        return PSIDModel.fromJson(json);
      });
      if (response.success) {
        psidInfo.value = response.data!;
      } else {
        Fluttertoast.showToast(msg: response.message);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      isBusy.value = false;
    }
  }

  fetchHistory({required String membershipNo}) async {

    // String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/api_local_responses/getHistoryApi.json");
    // final jsonResult = json.decode(data); //latest Dart
    // var response = Property.fromJson(jsonResult);
    // listOfHistory.value = response.memberBill ?? [];
    // listOfHistory.refresh();
    // return;

    isBusy.value = true;
    try {
      Map<String, dynamic> param = {
        'token': await Storage.authToken,
        "registration_no": membershipNo
      };
      ApiResponse<HistoryModel> response =
      await api.post(EndPoints.getHistory, param, false, (json) {
        return HistoryModel.fromJson(json);
      });
      if (response.success) {
        listOfHistory.value = response.data?.properties ?? [];
        listOfHistory.refresh();
      } else {
        Fluttertoast.showToast(msg: response.message ?? '');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    } finally {
      isBusy.value = false;
    }
  }

  generatePayFastLink() async {
    final _url = Uri.parse(
        'http://175.107.14.182:8080/maintenance/api/initiate-payment?&registration_no=${membershipNumber.value}&trans_amount=${fullAmountController.text}');
    try {
      // Use launchUrl with error handling
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    }
  }

  void _openPaymentPage() async {}

  downloadPDF() async {

    https://pha.npf.org.pk/Invoice_COL_®_RASHID_AKHTAR_SATTI_71174_20250409_160054.pdf"
    String url = psidInfo.value.pdflink?.replaceAll('https://pha.npf.org.pk/', 'https://pha.npf.org.pk/public/') ?? '';
    try {
      // Request storage permissions
      final permissionStatus = await Permission.storage.request();
      // if (!permissionStatus.isGranted) {
      //   // If permission is not granted, show a message
      //   Get.snackbar(
      //     'Permission Denied',
      //     'Storage permission is required to download the PDF',
      //     snackPosition: SnackPosition.TOP,
      //   );
      //   return;
      // }

      // Check if storage permission is granted
      // if (await Permission.storage.isGranted) {
      //   // Permission is already granted
      //   print('Storage permission granted');
      // } else {
      //   // Request storage permission
      //   PermissionStatus status = await Permission.storage.request();
      //   if (status.isGranted) {
      //     print('Storage permission granted');
      //   } else if (status.isDenied) {
      //     print('Storage permission denied');
      //   } else if (status.isPermanentlyDenied) {
      //     print('Storage permission permanently denied');
      //     // Open app settings for the user to grant permission
      //     await openAppSettings();
      //   }
      //   return;
      // }

      // Define Dio for downloading
      Dio dio = Dio();

      // Get directory to save the file
      Directory? directory = await getExternalStorageDirectory();
      String filePath = '${directory!.path}/bill-preview.pdf';

      // Check if file already exists, and handle accordingly
      if (File(filePath).existsSync()) {
        // Optionally rename the file if you don't want to overwrite
        filePath =
            '${directory.path}/bill-preview-${DateTime.now().millisecondsSinceEpoch}.pdf';
      }

      // Start the download and save the file
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = (received / total) * 100;
            print('Download Progress: $progress%');
            // You can display a loading progress bar here
          }
        },
      );

      // Show success notification
      Get.snackbar(
        'Success',
        'PDF downloaded to $filePath',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      // Show error notification if download fails
      Get.snackbar(
        'Error',
        'Failed to download PDF: $e',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      // isDownloading.value = false;
    }
  }
}
