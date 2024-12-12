
import 'package:pharesidence/Entities/project_details_model.dart';

class CityModel {
  String? city;
  String? cityImage;
  List<ProjectDetailsModel>? projects;

  CityModel({this.city, this.cityImage, this.projects});

  CityModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityImage = json['city_image'];
    if (json['projects'] != null) {
      projects = <ProjectDetailsModel>[];
      json['projects'].forEach((v) {
        projects!.add(new ProjectDetailsModel.fromJson(v));
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