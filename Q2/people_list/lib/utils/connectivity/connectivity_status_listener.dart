import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

// global variable to store the connectivity status
late bool isConnectedToNetwork;

class ConnectionStatusListener {
  static final Connectivity _connectivity = Connectivity();

  // listen to the change of connectivity
  static void _connectionChange(ConnectivityResult result) {
    isConnectedToNetwork = result != ConnectivityResult.none;
  }

  static Future<void> initialize() async {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }
}
