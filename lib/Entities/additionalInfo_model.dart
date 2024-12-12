//Modify
class AdditionalInfoModel {
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
  String? projectName;
  String? issueDate;
  String? dueDate;
  String? amount;
  String? lateFee;
  String? totalAmountDue;

  AdditionalInfoModel(
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
        this.projectName,
        this.issueDate,
        this.dueDate,
        this.amount,
        this.lateFee,
        this.totalAmountDue});

  AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
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
    projectName = json['projectName'];
    issueDate = json['issue_date'];
    dueDate = json['due_date'];
    amount = json['amount'];
    lateFee = json['late_fee'];
    totalAmountDue = json['total_amount_due'].toString();
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
    data['projectName'] = this.projectName;
    data['issue_date'] = this.issueDate;
    data['due_date'] = this.dueDate;
    data['amount'] = this.amount;
    data['late_fee'] = this.lateFee;
    data['total_amount_due'] = this.totalAmountDue;
    return data;
  }
}