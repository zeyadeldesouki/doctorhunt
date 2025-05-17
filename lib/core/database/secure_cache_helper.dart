import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheHelper {
  static const _storage = FlutterSecureStorage();

  static Future<void> setSecureData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> getSecureData({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteSecureData({required String key}) async {
    return await _storage.delete(key: key);
  }

  static Future<void> deleteAllSecureData() async {
    return await _storage.deleteAll();
  }
}
