import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/counter_controller.dart';
import 'package:getx_practice/home_screen.dart';
import 'package:getx_practice/profile_screen.dart';
import 'package:getx_practice/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      routes: {
        HomeScreen.name: (context) => const HomeScreen(),
        ProfileScreen.name: (context) => const ProfileScreen(),
        SettingsScreen.name: (context) => const SettingsScreen(),
      },
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(CounterController());
  }
}
