import 'package:http/http.dart' as http;
import 'package:pharesidence/Utils/exports/exports.dart';

class Config{
  static String pro_base_url = 'https://maintenance.pha.gov.pk/api';
  // https://maintenance.npf.org.pk/api/login
  // static String pro_base_url = 'https://maintenance.npf.org.pk/api';
  // static String pro_base_url = 'http://101.50.87.138:8080/maintenance/api';
  // static String pro_base_url = 'http://192.168.18.162:8002/api';
}

class EndPoints{
  static var login = '/login';
  static var signup = '/sginup';
  // static var getProjectByCNIC = '/getProjectsByCnicNew';
  // static var getAdditionalInfoByCNIC = '/getAddtionalInfoByCnicNew';
  // static var getPSID = '/getpsidnew';
  static var getHistory = '/p_history';
  static var getMemberships = '/membership';
  static var generateBill = '/generateBill';
  static var getPSID = '/getpsid';
  static var paymentStatus = '/check';
  // static var getHistory = '/previousBill';
}

class ApiService {
  final String baseUrl = Config.pro_base_url;

  Future<ApiResponse<T>> get<T>(String endpoint, bool authorization, T Function(dynamic) fromJson) async {
    if (!await InternetConnectionChecker().hasConnection) {
      throw NetworkException('No Internet Connection');
    }
    var _header;
    if (authorization){
      _header = {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer ${await Storage.authToken}',
      };
    }else{
      _header = {
        'Content-Type' : 'application/json',
      };
    }

    final response = await http.get(Uri.parse('$baseUrl$endpoint'), headers: _header);
    if (response.statusCode == 200|| response.statusCode == 404 || response.statusCode == 400) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      return ApiResponse<T>.fromJson(data, fromJson);
    } else {
      throw NetworkException('Internal Server Error');
    }
  }

  Future<ApiResponse<T>> post <T>(String endpoint, Map<String, dynamic> body, bool authorization,
      T Function(dynamic) fromJson) async {
    if (!await InternetConnectionChecker().hasConnection) {
      throw NetworkException('No Internet Connection');
    }
    var _header;
    if (authorization){
      _header = {
        'Content-Type' : 'application/json',
        'Authorization' : 'Bearer ${await Storage.authToken}',
      };
    }else{
      _header = {
        'Content-Type' : 'application/json',
      };
    }
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: _header,
      body: json.encode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 404 || response.statusCode == 400) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ApiResponse<T>.fromJson(data, fromJson);
    } else {
      throw NetworkException('Internal Server Error');
    }
  }
}