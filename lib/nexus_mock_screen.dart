import 'package:flutter/material.dart';
import 'package:getx_practice/widget/nexus_app_bar.dart';

class NexusMockScreen extends StatefulWidget {
  const NexusMockScreen({super.key});

  @override
  State<NexusMockScreen> createState() => _NexusMockScreenState();
}

class _NexusMockScreenState extends State<NexusMockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NexusAppBar(),
      body: Column(
        children: [Text("start design"), Text("This is Balance Card")],
      ),
    );
  }
}
