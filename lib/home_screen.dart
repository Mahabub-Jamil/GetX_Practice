import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/counter_controller.dart';
import 'package:getx_practice/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterController>(
              builder: (counterController) {
                return Text(
                  '${counterController.counter}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ProfileScreen()),
                // );
                // Get.to(ProfileScreen());
                Navigator.pushNamed(context, ProfileScreen.name);
              },
              child: Text("Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.showSnackbar(
                  GetSnackBar(
                    title: "Title",
                    message: "This is message",
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: Text("Show SnackBar"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
