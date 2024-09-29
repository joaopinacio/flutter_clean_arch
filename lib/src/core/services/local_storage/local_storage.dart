abstract class LocalStorage {
  Future get(String key);
  Future delete(String key);
  Future<bool> put(String key, dynamic value);
  Future<bool> remove(String key);
  Future<bool> clear();
}
