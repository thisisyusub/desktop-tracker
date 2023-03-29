import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityTest extends StatelessWidget {
  const ConnectivityTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return Center(
            child: Text(
              '${snapshot.data}',
              style: const TextStyle(fontSize: 40),
            ),
          );
        },
      ),
    );
  }
}
