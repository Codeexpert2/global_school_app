import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;

  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  Future<void> save(String key, String data) async {
    await _storage.write(key: key, value: data);
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }
}
