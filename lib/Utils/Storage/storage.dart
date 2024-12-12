import 'package:pharesidence/Utils/exports/exports.dart';

class Storage {
  static getBy(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return json.decode(prefs.getString(key)!);
    } catch (e) {
      throw SharedPrefException('Error on getting data from preferences: $e');
    }
  }

  static set(String key, value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, json.encode(value));
    } catch (e) {
      throw SharedPrefException('Error on saving data to preferences: $e');
    }
  }

  static remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
    } catch (e) {
      throw SharedPrefException('Error on removing data from preferences: $e');
    }
  }

  static Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<bool> containKey(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    } catch (e) {
      throw SharedPrefException('Error on getting data from preferences: $e');
    }
  }

  static saveUser({SignInModel? user}) async =>
      await set(SessionKeys.KUSER, user);

  // static saveCNIC({String? cnic}) async =>
  //     await set(SessionKeys.KCNIC, cnic);

  static saveAuthToken({String? token}) async =>
      await set(SessionKeys.KAUTHTOKEN, token);

  static Future<SignInModel> getUserInfo() async {
    return SignInModel.fromJson(await getBy(SessionKeys.KUSER));
  }

  static Future<String> get authToken async {
    return await getBy(SessionKeys.KAUTHTOKEN);
  }

  // static Future<String> get cnic async {
  //   return await getBy(SessionKeys.KCNIC);
  // }
}

class SessionKeys{
  static String KUSER = 'user';
  static String KAUTHTOKEN = 'auth';
  static String KCNIC = 'cnic';
}