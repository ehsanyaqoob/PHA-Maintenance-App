import 'package:get/get.dart';
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
  var listOfHistory = <MemberBill>[].obs;
  Rx<AdditionalInfoModel> additionalInfo = AdditionalInfoModel().obs;
  Rx<PSIDModel> psidInfo = PSIDModel().obs;
  var membershipNumber = ''.obs;

  var selectedPaymentOption = 'Pay full'.obs;
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
      paidAmount.value = '${additionalInfo.value.totalAmountDue}';
      fullAmountController.text = paidAmount.value;
    } else if (value == 'Pay Partial') {
      paidAmount.value = '';
      fullAmountController.text = '';
    }
    update();
  }

  fetchProperties() async {
    if (user.value.memberType == 'tenant') {
      return;
    }
    await fetchProjects(cnicOrMembership: user.value.cnic ?? '');
  }

  fetchProjects({required String cnicOrMembership}) async {
    isBusy.value = true;
    try {
      Map<String, dynamic> param = {
        "cnic": cnicOrMembership,
        "memberType": user.value.memberType ?? 'owner'
      };
      ApiResponse<PropertyModel> response =
          await api.post(EndPoints.getProjectByCNIC, param, true, (json) {
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

  fetchAdditionalInfo({required String membershipNo}) async {
    membershipNumber.value = membershipNo;
    isBusy.value = true;
    try {
      Map<String, dynamic> param = {"registration_no": membershipNo};
      ApiResponse<AdditionalInfoModel> response = await api
          .post(EndPoints.getAdditionalInfoByCNIC, param, true, (json) {
        return AdditionalInfoModel.fromJson(json);
      });
      if (response.success) {
        additionalInfo.value = response.data!;
        paidAmount.value = '${additionalInfo.value.totalAmountDue}';
        fullAmountController.text = paidAmount.value;
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

  fetchPSID({required String membershipNo}) async {
    isBusy.value = true;
    var user = await Storage.getUserInfo();
    // var cnic  = await Storage.cnic;
    try {
      Map<String, dynamic> param = {
        "registration_no": membershipNo,
        "amount": fullAmountController.text.replaceAll(',', '')
      };
      ApiResponse<PSIDModel> response =
          await api.post(EndPoints.getPSID, param, true, (json) {
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
    isBusy.value = true;
    try {
      Map<String, dynamic> param = {
        "registration_no": membershipNo,
        "amount": fullAmountController.text
      };
      ApiResponse<Property> response =
      await api.post(EndPoints.getHistory, param, true, (json) {
        return Property.fromJson(json);
      });
      if (response.success) {
        listOfHistory.value = response.data?.memberBill ?? [];
        listOfHistory.refresh();
      } else {
        Fluttertoast.showToast(msg: response.message);
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
    String url = psidInfo.value.pdflink ?? '';
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
