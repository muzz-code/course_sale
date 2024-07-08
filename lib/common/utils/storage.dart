import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import '../../features/auth/sign_in/entities/user.dart';
import '../../global/global.dart';

class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME_KEY) ??
        false;
  }

  bool isLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) != null;
  }

  Future<void> saveUserProfile(UserProfile userProfile) async {
    String userProfileString = jsonEncode(userProfile.toJson());
    await Global.storageService
        .setString(AppConstants.STORAGE_USER_PROFILE_KEY, userProfileString);
  }

  UserProfile? getUserProfile() {
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profile.isNotEmpty) {
      try {
        var profileJson = jsonDecode(profile);
        var userprofile = UserProfile.fromJson(profileJson);
        return userprofile;
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
