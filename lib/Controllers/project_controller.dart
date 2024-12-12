import 'package:get/get.dart';
import 'package:pharesidence/Entities/city_model.dart';
import 'package:pharesidence/Entities/project_model.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class ProjectController extends GetxController{

  var projects = <CityModel>[].obs;

  ProjectController(){
    getProjects();
  }

  getProjects()async{
    String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/project_details.json");
    final jsonResult = json.decode(data); //latest Dart
    projects.value = PHAProjects.fromJson(jsonResult).projects ?? [];
    projects.refresh();
  }

}

