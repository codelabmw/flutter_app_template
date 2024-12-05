import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import '../contracts/services/connectivity_service.dart';

class AppConnectivityService implements ConnectivityService {
  late final InternetConnectivity _internetConnectivity;

  AppConnectivityService() {
    _internetConnectivity = InternetConnectivity();
  }

  @override
  Future<bool> hasInternetConnection() {
    return _internetConnectivity.hasInternetConnection;
  }
}
