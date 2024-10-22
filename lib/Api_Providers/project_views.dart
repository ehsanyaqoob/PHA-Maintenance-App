class Citizen {
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
  final String projectName;

  Citizen({
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
    required this.projectName,
  });

  // Factory method to parse JSON data
  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
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
      projectName: json['projectName'],
    );
  }

  // Method to convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registration_no': registrationNo,
      'project_id': projectId,
      'full_name': fullName,
      'cnic': cnic,
      'lane_no': laneNo,
      'house_no': houseNo,
      'category': category,
      'present_address': presentAddress,
      'cell': cell,
      'status': status,
      'projectName': projectName,
    };
  }
}

// Main function to demonstrate JSON parsing
// void main() {
//   // Simulated JSON response
//   final jsonResponse = {
//     "status": true,
//     "message": "success",
//     "data": [
//       {
//         "id": 9,
//         "registration_no": "800-00855",
//         "project_id": 1,
//         "full_name": "MR. KASHIF RIAZ",
//         "cnic": "35201-1420420-1",
//         "lane_no": "1",
//         "house_no": "9",
//         "category": "I",
//         "present_address": "HOUSE NO.78-BC, GALI NO.05, BAHAWALPUR CANTT TEHSIL & DISTRICT BAHAWALPUR",
//         "cell": "0333-5251784",
//         "status": "Finished",
//         "created_at": null,
//         "updated_at": null,
//         "deleted_at": null,
//         "projectName": "Kurri Road"
//       }
//     ]
//   };
//
//   // Parsing the data
//   if (jsonResponse['status'] != null) {
//     List<Citizen> citizens = (jsonResponse['data'] as List)
//         .map((item) => Citizen.fromJson(item))
//         .toList();
//
//     // Print parsed citizen details
//     for (var citizen in citizens) {
//       print('Full Name: ${citizen.fullName}, Registration No: ${citizen.registrationNo}');
//     }
//   }
// }
