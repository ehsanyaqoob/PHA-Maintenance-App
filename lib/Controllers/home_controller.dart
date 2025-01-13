import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Views/propertyView.dart';

class HomeController extends GetxController{

  var propertyController = Get.put(PropertyController());

  var greyStructureCount = ''.obs;
  var apartmentCount = ''.obs;
  var commercialCount = ''.obs;
  Rx<SignInModel> user = SignInModel().obs;

  var listOfPropertySummary = [].obs;

  var listOfServices = [
    HomeModel(
        image: 'assets/svg/icon_Property_Paymenst.svg',
        title: 'Property Maintenance & Payments',
        onTap: () {
          Get.to(PropertyViews());
        }),
    HomeModel(
        image: 'assets/svg/icon_services.svg',
        title: 'Services',
        onTap: () => Get.to(ServicesViews())),
    HomeModel(
        image: 'assets/svg/icon_help.svg',
        title: 'Help',
        onTap: () => Get.to(HelpViews())),
    HomeModel(
        image: 'assets/svg/icon_sos.svg',
        title: 'SOS',
        onTap: () => Get.to(SoSView())),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserData();
    updatePropertySummary();
  }

  loadUserData()async{
    user.value = await Storage.getUserInfo();
    user.refresh();
  }

  updatePropertySummary()async{
    await propertyController.getUserData();
    await propertyController.fetchProperties();
    listOfPropertySummary.value = [
      HomeModel(
          image: 'assets/png/icon_gray_structure.svg',
          title: 'Grey Structure',
          count: '${propertyController.listOfProperties.value.where((e) => e.status == 'Grey Structure').length}',
          onTap: () {}),
      HomeModel(
          image: 'assets/png/icon_apartments.svg',
          title: 'Finished',
          count: '${propertyController.listOfProperties.value.where((e) => e.status == 'Finished').length}',
          onTap: () {}),
      HomeModel(
          image: 'assets/png/icon_apartments.svg',
          title: 'Progressing',
          count: '${propertyController.listOfProperties.value.where((e) => e.status == 'Under Construction').length}',
          onTap: () {}),
    ];
    listOfPropertySummary.refresh();
  }

  String formatCNIC(String cnic) {
    if (cnic.length != 13) {
      throw ArgumentError('Invalid CNIC length. It should be 13 digits long.');
    }

    // Insert hyphens at the desired positions
    String formatted = '${cnic.substring(0, 5)}-${cnic.substring(5, 12)}-${cnic.substring(12)}';

    return formatted;
  }

  String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length != 11) {
      throw ArgumentError('Invalid phone number length. It should be 11 digits long.');
    }

    // Insert a hyphen after the first 4 digits
    String formatted = '${phoneNumber.substring(0, 4)}-${phoneNumber.substring(4)}';

    return formatted;
  }
}

