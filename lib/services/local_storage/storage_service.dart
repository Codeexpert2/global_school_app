import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:template/core/extensions/extensions.dart';

typedef JsonMap = Map<String, dynamic>;
typedef JsonList = List<JsonMap>;

class StorageService {
  StorageService(
    this._box,
  );
  final GetStorage _box;

  Future<void> save(String key, String data) => _box.write(key, data);

  String read(String key) => _box.read<String>(key) ?? '';

  Future<void> remove(String key) => _box.remove(key);

  Future<void> clear() => _box.erase();

  /// Save a Json object to local persistent storage

  Future<void> saveJson(String key, JsonMap value) async {
    String jsonString = json.encode(value);
    await _box.write(key, jsonString);
  }

  /// Get a Json object from local persistent storage

  JsonMap? readJson(String key) {
    String? jsonString = _box.read(key);
    if (jsonString == null) return null;
    JsonMap value = jsonDecode(jsonString);
    return value;
  }

  bool readBool(String key) => _box.read<bool>(key) ?? false;

  Future<void> saveBool(String key, bool data) => _box.write(key, data);

  dynamic readJsonList(String key) {
    // Retrieve the JSON string from storage
    String? jsonString = _box.read<String>(key);

    // Return an empty list if no data is found in storage
    if (jsonString.isEmptyOrNull) return [];

    // Parse the JSON string into a list of JSON maps
    return jsonDecode(jsonString!);
  }

  Future<void> saveJsonList(String key, JsonList value) async {
    // Serialize the list of JSON maps to a JSON string
    String jsonString = jsonEncode(value);

    // Save the JSON string to storage
    await _box.write(key, jsonString);
  }
}
