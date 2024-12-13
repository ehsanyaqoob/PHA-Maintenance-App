class MemberBill {
  int? id;
  int? membershipId;
  Null? paymentMethod;
  String? category;
  String? issuedDate;
  String? dueDate;
  String? totalAmount;
  String? billStatus;
  String? pdflink;

  MemberBill(
      {this.id,
        this.membershipId,
        this.paymentMethod,
        this.category,
        this.issuedDate,
        this.dueDate,
        this.totalAmount,
        this.billStatus,
        this.pdflink});

  MemberBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipId = json['membership_id'];
    paymentMethod = json['payment_method'];
    category = json['category'];
    issuedDate = json['issued_date'];
    dueDate = json['due_date'];
    totalAmount = json['total_amount'];
    billStatus = json['bill_status'];
    pdflink = json['pdflink'];
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
    data['pdflink'] = this.pdflink;
    return data;
  }
}