class PaymentStatusModel {
  bool? status;
  String? message;
  Data? data;

  PaymentStatusModel({this.status, this.message, this.data});

  PaymentStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? psid;
  String? amount;
  String? status;

  Data({this.psid, this.amount});

  Data.fromJson(Map<String, dynamic> json) {
    psid = json['psid'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['psid'] = this.psid;
    data['amount'] = this.amount;
    data['status'] = this.status;
    return data;
  }
}