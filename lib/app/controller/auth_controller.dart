import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/shared/data/model/user_model.dart';

class AuthController {
  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user-data';

  static String? accessToken;
  static UserModel? userModel;

  /// Save user data
  static Future<void> saveUserData(String userToken, UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, userToken);
    await sharedPreferences.setString(_userDataKey, jsonEncode(user.toJson()));

    accessToken = userToken;
    userModel = user;
  }

  /// Load user data
  static Future<void> loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);

    if (accessToken != null) {
      userModel = UserModel.fromJson(
        jsonDecode(sharedPreferences.getString(_userDataKey)!),
      );
    } else {
      return;
    }
  }

  /// Is user logged in or not
  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenKey) != null;
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_accessTokenKey);
    await sharedPreferences.remove(_userDataKey);

    accessToken = null;
    userModel = null;
  }
}
