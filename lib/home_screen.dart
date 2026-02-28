import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (CounterController) {
            return Text(
              '${CounterController.counter}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            );
          },
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

class CounterController extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update();
  }
}
