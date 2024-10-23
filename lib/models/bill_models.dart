// models/bill_model.dart

class BillModel {
  final String name;
  final String property;
  final String location;
  final String category;
  final String billNo;
  final String period;
  final String issueDate;
  final String dueDate;
  final double maintenanceCharges;
  final double latePaymentCharges;

  BillModel({
    required this.name,
    required this.property,
    required this.location,
    required this.category,
    required this.billNo,
    required this.period,
    required this.issueDate,
    required this.dueDate,
    required this.maintenanceCharges,
    required this.latePaymentCharges,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      name: json['name'],
      property: json['property'],
      location: json['location'],
      category: json['category'],
      billNo: json['billNo'],
      period: json['period'],
      issueDate: json['issueDate'],
      dueDate: json['dueDate'],
      maintenanceCharges: json['maintenanceCharges'],
      latePaymentCharges: json['latePaymentCharges'],
    );
  }
}
