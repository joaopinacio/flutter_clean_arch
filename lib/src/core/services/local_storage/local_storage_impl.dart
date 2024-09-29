import 'package:gestao_obra_mobile/src/core/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  SharedPreferences? shared;

  @override
  Future get(String key) async {
    shared ??= await SharedPreferences.getInstance();

    return shared!.get(key);
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    shared ??= await SharedPreferences.getInstance();

    if (value is bool) {
      return await shared!.setBool(key, value);
    } else if (value is String) {
      return await shared!.setString(key, value);
    } else if (value is int) {
      return await shared!.setInt(key, value);
    } else if (value is double) {
      return await shared!.setDouble(key, value);
    } else if (value is List<String>) {
      return await shared!.setStringList(key, value);
    }

    return false;
  }

  @override
  Future delete(String key) async {
    shared ??= await SharedPreferences.getInstance();

    await shared!.remove(key);
  }

  @override
  Future<bool> remove(String key) async {
    return await shared!.remove(key);
  }

  @override
  Future<bool> clear() async {
    return await shared!.clear();
  }
}
