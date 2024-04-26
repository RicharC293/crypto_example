import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart' as net;
import 'package:crypto_example/app/widgets/messages/messages.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class Connectivity {
  Connectivity._privateConstructor();

  static Connectivity instance = Connectivity._privateConstructor();

  late StreamSubscription<List<net.ConnectivityResult>>?
      _connectivitySubscription;
  final net.Connectivity _connectivity = net.Connectivity();

  Future<void> watch(BuildContext context) async {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (network) {
        debugPrint("NETWORK_CONNECTION ${network.first.name}");

        /// Handle lost connection issue
        /// Debounce to avoid multiple calls in the case of iOS
        EasyDebounce.debounce(
            'connectivity_toast', const Duration(milliseconds: 500), () {
          if (network.first == net.ConnectivityResult.none) {
            const Messages(message: 'No internet connection').error(context);
            return;
          }
        });
      },
    );
  }

  void dispose() async {
    _connectivitySubscription?.cancel();
  }
}
