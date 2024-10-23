class AdditionalInfoModel {
  final bool status;
  final String message;
  final List<AdditionalInfoData>? data;

  AdditionalInfoModel({required this.status, required this.message, this.data});

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) {
    return AdditionalInfoModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((item) => AdditionalInfoData.fromJson(item))
          .toList(),
    );
  }
}

class AdditionalInfoData {
  final int id;
  final String registrationNo;
  final int projectId;
  final String fullName;
  final String cnic;
  final String laneNo;
  final String houseNo;
  final String category;
  final String presentAddress;
  final String cell;
  final String status;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String projectName;
  final String issueDate;
  final String dueDate;
  final String amount;
  final int lateFee;
  final int totalAmountDue;

  AdditionalInfoData({
    required this.id,
    required this.registrationNo,
    required this.projectId,
    required this.fullName,
    required this.cnic,
    required this.laneNo,
    required this.houseNo,
    required this.category,
    required this.presentAddress,
    required this.cell,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.projectName,
    required this.issueDate,
    required this.dueDate,
    required this.amount,
    required this.lateFee,
    required this.totalAmountDue,
  });

  factory AdditionalInfoData.fromJson(Map<String, dynamic> json) {
    return AdditionalInfoData(
      id: json['id'],
      registrationNo: json['registration_no'],
      projectId: json['project_id'],
      fullName: json['full_name'],
      cnic: json['cnic'],
      laneNo: json['lane_no'],
      houseNo: json['house_no'],
      category: json['category'],
      presentAddress: json['present_address'],
      cell: json['cell'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      projectName: json['projectName'],
      issueDate: json['issue_date'],
      dueDate: json['due_date'],
      amount: json['amount'],
      lateFee: json['late_fee'],
      totalAmountDue: json['total_amount_due'],
    );
  }
}
