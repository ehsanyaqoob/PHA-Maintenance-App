
class HistoryModel {
  List<History>? properties;

  HistoryModel({this.properties});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['member_bill'] != null) {
      properties = <History>[];
      json['member_bill'].forEach((v) {
        properties!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.properties != null) {
      data['member_bill'] = this.properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  int? id;
  int? membershipId;
  Null? paymentMethod;
  String? category;
  String? issuedDate;
  String? dueDate;
  String? totalAmount;
  String? billStatus;
  String? paidAmount;
  String? lateFeeCharges;
  String? arears;

  History(
      {this.id,
        this.membershipId,
        this.paymentMethod,
        this.category,
        this.issuedDate,
        this.dueDate,
        this.totalAmount,
        this.billStatus,
        this.paidAmount,
        this.lateFeeCharges,
        this.arears});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipId = json['membership_id'];
    paymentMethod = json['payment_method'];
    category = json['category'];
    issuedDate = json['issued_date'];
    dueDate = json['due_date'];
    totalAmount = json['total_amount'];
    billStatus = json['bill_status'];
    paidAmount = json['paid_amount'];
    lateFeeCharges = json['late_fee_charges'];
    arears = json['arears'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['membership_id'] = this.membershipId;
    data['payment_method'] = this.paymentMethod;
    data['category'] = this.category;
    data['issued_date'] = this.issuedDate;
    data['due_date'] = this.dueDate;
    data['total_amount'] = this.totalAmount;
    data['bill_status'] = this.billStatus;
    data['paid_amount'] = this.paidAmount;
    data['late_fee_charges'] = this.lateFeeCharges;
    data['arears'] = this.arears;
    return data;
  }
}