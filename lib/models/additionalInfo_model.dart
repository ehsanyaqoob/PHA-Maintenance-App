class AdditionalInfoModel {
  bool? status;
  String? message;
  List<AdditionalInfoData>? data;

  AdditionalInfoModel({this.status, this.message, this.data});

  AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AdditionalInfoData>[];
      json['data'].forEach((v) {
        data!.add(new AdditionalInfoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdditionalInfoData {
  int? id;
  String? registrationNo;
  int? projectId;
  String? fullName;
  String? cnic;
  String? laneNo;
  String? houseNo;
  String? category;
  String? presentAddress;
  String? cell;
  String? status;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;
  String? projectName;
  String? issueDate;
  String? dueDate;
  String? amount;
  int? lateFee;
  int? totalAmountDue;

  AdditionalInfoData(
      {this.id,
        this.registrationNo,
        this.projectId,
        this.fullName,
        this.cnic,
        this.laneNo,
        this.houseNo,
        this.category,
        this.presentAddress,
        this.cell,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.projectName,
        this.issueDate,
        this.dueDate,
        this.amount,
        this.lateFee,
        this.totalAmountDue});

  AdditionalInfoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationNo = json['registration_no'];
    projectId = json['project_id'];
    fullName = json['full_name'];
    cnic = json['cnic'];
    laneNo = json['lane_no'];
    houseNo = json['house_no'];
    category = json['category'];
    presentAddress = json['present_address'];
    cell = json['cell'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    projectName = json['projectName'];
    issueDate = json['issue_date'];
    dueDate = json['due_date'];
    amount = json['amount'];
    lateFee = json['late_fee'];
    totalAmountDue = json['total_amount_due'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['registration_no'] = this.registrationNo;
    data['project_id'] = this.projectId;
    data['full_name'] = this.fullName;
    data['cnic'] = this.cnic;
    data['lane_no'] = this.laneNo;
    data['house_no'] = this.houseNo;
    data['category'] = this.category;
    data['present_address'] = this.presentAddress;
    data['cell'] = this.cell;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['projectName'] = this.projectName;
    data['issue_date'] = this.issueDate;
    data['due_date'] = this.dueDate;
    data['amount'] = this.amount;
    data['late_fee'] = this.lateFee;
    data['total_amount_due'] = this.totalAmountDue;
    return data;
  }
}