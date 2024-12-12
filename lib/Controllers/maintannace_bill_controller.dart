
import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class MaintenanceDetailsController extends GetxController {
  // Sample data for the table
  var apartmentName = "H.No 16-C, St.No.2,Kurii Road".obs;
  var ownerName = "MR. NAFASAT RAZA".obs;
  var category = "Residential".obs;
  var consumerId = "123456789".obs;
  var billNumber = "987654321".obs;
  var billingPeriod = "June 2024".obs;
  var issueDate = "01-July-2024".obs;
  var dueDate = "08-July-2024".obs;


   // Reactive boolean to manage expanded state
  var isExpanded = false.obs;

  // Method to toggle the expanded state
  void toggleInfo() {
    isExpanded.value = !isExpanded.value;
  }
}



