
import 'package:pharesidence/Entities/city_model.dart';

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
