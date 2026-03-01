import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String name = 'settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => HomeScreen());
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}
