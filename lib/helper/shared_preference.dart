import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userCredentialIdKey = "USERCREDENTIALKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userRoleKey = "LOGEDINKEY";

  Future<bool> saveUserCredentialId(String getUserCredentialId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userCredentialIdKey, getUserCredentialId);
  }

  Future<bool> saveUserName(var getUserName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(var getUserEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveRole(var getRole) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userRoleKey, getRole);
  }

  Future<String?> getUserCredentialId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userCredentialIdKey);
  }

  Future<String?> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }

  Future<String?> getRole() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userRoleKey);
  }
}
