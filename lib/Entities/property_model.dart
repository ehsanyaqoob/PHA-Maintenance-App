//Modify
import 'package:pharesidence/Entities/member_bill_model.dart';

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
  String? paidAmount;
  String? lateFee;
  String? remainingBalance;
  String? totalAmountDue;
  List<MemberBill>? memberBill;

  Property(
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
        this.paidAmount,
        this.lateFee,
        this.remainingBalance,
        this.totalAmountDue,
        this.memberBill});

  Property.fromJson(Map<String, dynamic> json) {
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
    paidAmount = json['paid_amount'];
    lateFee = '${json['late_fee']}';
    remainingBalance = '${json['remaining_balance']}';
    totalAmountDue = '${json['total_amount_due']}';
    if (json['member_bill'] != null) {
      memberBill = <MemberBill>[];
      json['member_bill'].forEach((v) {
        memberBill!.add(new MemberBill.fromJson(v));
      });
    }
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
    data['paid_amount'] = this.paidAmount;
    data['late_fee'] = this.lateFee;
    data['remaining_balance'] = this.remainingBalance;
    data['total_amount_due'] = this.totalAmountDue;
    if (this.memberBill != null) {
      data['member_bill'] = this.memberBill!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

