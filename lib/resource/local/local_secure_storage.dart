import 'package:flutter_donation/resource/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureStorage {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // --- TOKEN ---

  static Future<void> saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: "token");
  }

  // --- USER ---

  static Future<void> saveUser(UserModel user) async {
    await _storage.write(key: "user", value: user.toJson());
  }

  static Future<UserModel?> getUser() async {
    final userJson = await _storage.read(key: "user");
    return userJson != null ? UserModel.fromJson(userJson) : null;
  }

  static Future<void> deleteUser() async {
    await _storage.delete(key: "user");
  }

  // --- CLEAR ALL ---

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
