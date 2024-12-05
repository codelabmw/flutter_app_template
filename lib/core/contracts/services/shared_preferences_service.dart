abstract interface class SharedPreferencesService {
  /// Write a value to storage identified by key.
  Future store(String key, dynamic value);

  /// Get a value from storage identified by key or default to fallback.
  Future get(String key, {dynamic fallback});

  /// Remove a value from storage identified by key.
  Future remove(String key);

  /// Remove all stored key - value pairs in storage.
  Future reset();
}
