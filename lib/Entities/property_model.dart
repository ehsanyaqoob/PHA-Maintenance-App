//Modify
class PropertyModel {
  List<Property>? projects;

  PropertyModel({this.projects});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Property>[];
      json['projects'].forEach((v) {
        projects!.add(new Property.fromJson(v));
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

class Property {
  int? id;
  String? cnic;
  String? cell;
  String? fullName;
  String? memberType;
  String? registrationNo;
  int? projectId;
  String? laneNo;
  String? houseNo;
  String? category;
  String? presentAddress;
  String? status;
  String? projectName;

  Property(
      {this.id,
        this.cnic,
        this.cell,
        this.fullName,
        this.memberType,
        this.registrationNo,
        this.projectId,
        this.laneNo,
        this.houseNo,
        this.category,
        this.presentAddress,
        this.status,
        this.projectName});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnic = json['cnic'];
    cell = json['cell'];
    fullName = json['full_name'];
    memberType = json['memberType'];
    registrationNo = json['registration_no'];
    projectId = json['project_id'];
    laneNo = json['lane_no'];
    houseNo = json['house_no'];
    category = json['category'];
    presentAddress = json['present_address'];
    status = json['status'];
    projectName = json['projectName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cnic'] = this.cnic;
    data['cell'] = this.cell;
    data['full_name'] = this.fullName;
    data['memberType'] = this.memberType;
    data['registration_no'] = this.registrationNo;
    data['project_id'] = this.projectId;
    data['lane_no'] = this.laneNo;
    data['house_no'] = this.houseNo;
    data['category'] = this.category;
    data['present_address'] = this.presentAddress;
    data['status'] = this.status;
    data['projectName'] = this.projectName;
    return data;
  }
}

