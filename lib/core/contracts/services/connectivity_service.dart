abstract interface class ConnectivityService {
  /// Determines whether the device has a working internet connection.
  Future<bool> hasInternetConnection();
}
