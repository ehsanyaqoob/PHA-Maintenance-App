import 'dart:convert';
import 'package:get/get.dart';
import 'package:pharesidence/exports/exports.dart';

class DummyProjectController extends GetxController{

  var projects = <CityModel>[].obs;

  DummyProjectController(){
    getProjects();
  }

  getProjects()async{
    String data = await DefaultAssetBundle.of(Get.context!).loadString("assets/project_details.json");
    final jsonResult = json.decode(data); //latest Dart
    projects.value = PHAProjects.fromJson(jsonResult).projects ?? [];
    projects.refresh();
  }

}

class PHAProjects {
  List<CityModel>? projects;

  PHAProjects({this.projects});

  PHAProjects.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <CityModel>[];
      json['projects'].forEach((v) {
        projects!.add(new CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityModel {
  String? city;
  String? cityImage;
  List<ProjectModel>? projects;

  CityModel({this.city, this.cityImage, this.projects});

  CityModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityImage = json['city_image'];
    if (json['projects'] != null) {
      projects = <ProjectModel>[];
      json['projects'].forEach((v) {
        projects!.add(new ProjectModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['city_image'] = this.cityImage;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectModel {
  String? projectName;
  String? projectImage;
  String? projectLocation;
  String? projectType;
  String? projectCategories;
  String? projectTotalApartments;
  String? projectCompletedPeriod;
  String? projectTotalPrice;
  String? projectDetails;

  ProjectModel(
      {this.projectName,
        this.projectImage,
        this.projectLocation,
        this.projectType,
        this.projectCategories,
        this.projectTotalApartments,
        this.projectCompletedPeriod,
        this.projectTotalPrice,
        this.projectDetails});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectName = json['project_name'];
    projectImage = json['project_image'];
    projectLocation = json['project_location'];
    projectType = json['project_type'];
    projectCategories = json['project_categories'];
    projectTotalApartments = json['project_total_apartments'];
    projectCompletedPeriod = json['project_completed_period'];
    projectTotalPrice = json['project_total_price'];
    projectDetails = json['project_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_name'] = this.projectName;
    data['project_image'] = this.projectImage;
    data['project_location'] = this.projectLocation;
    data['project_type'] = this.projectType;
    data['project_categories'] = this.projectCategories;
    data['project_total_apartments'] = this.projectTotalApartments;
    data['project_completed_period'] = this.projectCompletedPeriod;
    data['project_total_price'] = this.projectTotalPrice;
    data['project_details'] = this.projectDetails;
    return data;
  }
}