class MonthlyPayment {
  final String month;
  final String date;
  final double totalAmount;
  final double paidAmount;
  final double unpaidAmount;
  final String status; // 'Paid', 'Unpaid', 'Upcoming'

  MonthlyPayment({
    required this.month,
    required this.date,
    required this.totalAmount,
    required this.paidAmount,
    required this.unpaidAmount,
    required this.status,
  });
}
