//Modify
class AdditionalInfoModel {
  String? fullName;
  String? cnic;
  String? cell;
  String? registrationNo;
  String? houseNo;
  int? membershipId;
  String? projectName;
  String? issuedDate;
  String? dueDate;
  String? totalAmount;
  String? paidAmount;
  String? remainingAmount;
  String? lateFeeCharges;
  int? grandTotal;
  int? unpaidBillsCount;
  int? totalPreviousBill;
  int? totalPreviousBillLateFee;
  String? arears;

  AdditionalInfoModel(
      {this.fullName,
        this.cnic,
        this.cell,
        this.registrationNo,
        this.houseNo,
        this.membershipId,
        this.projectName,
        this.issuedDate,
        this.dueDate,
        this.totalAmount,
        this.paidAmount,
        this.remainingAmount,
        this.lateFeeCharges,
        this.grandTotal,
        this.unpaidBillsCount,
        this.totalPreviousBill,
        this.totalPreviousBillLateFee, this.arears});

  AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    cnic = json['cnic'];
    cell = json['cell'];
    registrationNo = json['registration_no'];
    houseNo = json['house_no'];
    membershipId = json['membership_id'];
    projectName = json['project_name'];
    issuedDate = json['issued_date'];
    dueDate = json['due_date'];
    totalAmount = json['total_amount'];
    paidAmount = json['paid_amount'];
    remainingAmount = json['remaining_amount'];
    lateFeeCharges = json['late_fee_charges'];
    grandTotal = json['grand_total'];
    unpaidBillsCount = json['unpaid_bills_count'];
    totalPreviousBill = json['total_previous_bill'];
    totalPreviousBillLateFee = json['total_previous_bill_late_fee'];
    arears = json['arears'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['cnic'] = this.cnic;
    data['cell'] = this.cell;
    data['registration_no'] = this.registrationNo;
    data['house_no'] = this.houseNo;
    data['membership_id'] = this.membershipId;
    data['project_name'] = this.projectName;
    data['issued_date'] = this.issuedDate;
    data['due_date'] = this.dueDate;
    data['total_amount'] = this.totalAmount;
    data['paid_amount'] = this.paidAmount;
    data['remaining_amount'] = this.remainingAmount;
    data['late_fee_charges'] = this.lateFeeCharges;
    data['grand_total'] = this.grandTotal;
    data['total_previous_bill'] = this.totalPreviousBill;
    data['total_previous_bill_late_fee'] = this.totalPreviousBillLateFee;
    data['unpaid_bills_count'] = this.unpaidBillsCount;
    data['arears'] = this.arears;
    return data;
  }
}