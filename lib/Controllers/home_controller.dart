import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Views/propertyView.dart';

class HomeController extends GetxController{

  var propertyController = Get.put(PropertyController());
  Rx<SignInModel> user = SignInModel().obs;

  var listOfPropertySummary = [].obs;

  var listOfServices = [
    HomeModel(
        image: 'assets/svg/icon_Property_Paymenst.svg',
        title: 'Property Maintenance & Payments \n جائیداد کی دیکھ بھال اور ادائیگیاں',
        onTap: () {
          Get.to(PropertyViews());
        }),
    HomeModel(
        image: 'assets/svg/icon_services.svg',
        title: 'Services \ خدمات',
        onTap: () => Get.to(ServicesViews())),
    HomeModel(
        image: 'assets/svg/icon_help.svg',
        title: 'Help / مددْْ',
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
          image: 'assets/png/icon_commercial.svg',
          title: 'Progressing',
          count: '${propertyController.listOfProperties.value.where((e) => e.status == 'Under Construction').length}',
          onTap: () {}),
    ];
    listOfPropertySummary.refresh();
  }
}

