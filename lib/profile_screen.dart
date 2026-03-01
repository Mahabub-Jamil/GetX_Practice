import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String name = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SettingsScreen()),
            // );
            // Get.to(() => SettingsScreen());
            Navigator.pushReplacementNamed(context, SettingsScreen.name);
          },
          child: Text('Settings'),
        ),
      ),
    );
  }
}
