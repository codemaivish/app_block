import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example.app_blocker/service');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Blocker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _startService();
                },
                child: Text('Start Service'),
              ),
              ElevatedButton(
                onPressed: () {
                  _requestAccessibilityPermission();
                },
                child: Text('Request Accessibility Permission'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startService() async {
    try {
      final String result = await platform.invokeMethod('startService');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  void _requestAccessibilityPermission() async {
    try {
      final String result =
          await platform.invokeMethod('requestAccessibilityPermission');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }
}
