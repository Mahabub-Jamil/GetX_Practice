import 'package:flutter/material.dart';

class UpdateScore extends StatefulWidget {
  const UpdateScore({super.key});

  @override
  State<UpdateScore> createState() => _UpdateScoreState();
}

class _UpdateScoreState extends State<UpdateScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Score"), actions: [

        ],
      ),
    );
  }
}
