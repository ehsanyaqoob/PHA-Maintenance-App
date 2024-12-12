// import 'package:pharesidence/Utils/exports/exports.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:pharesidence/models/bill_models.dart';
// import '../../Api_Providers/Api_Responses/api_urls.dart';
//
//
// class ApiService {
//
//   Future<BillModel> fetchBill(String userId) async {
//     final response = await http.get(Uri.parse('$baseUrl/bills/$userId'));
//
//     if (response.statusCode == 200) {
//       return BillModel.fromJson(json.decode(response.body));
//     } else {
//       // Handle different status codes appropriately
//       if (response.statusCode == 404) {
//         throw Exception('Bill not found');
//       } else if (response.statusCode == 500) {
//         throw Exception('Server error');
//       } else {
//         throw Exception('Failed to load bill: ${response.reasonPhrase}');
//       }
//     }
//   }
// }
