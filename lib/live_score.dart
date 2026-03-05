import 'package:flutter/material.dart';

class LiveScoreHome extends StatefulWidget {
  const LiveScoreHome({super.key});

  @override
  State<LiveScoreHome> createState() => _LiveScoreHomeState();
}

class _LiveScoreHomeState extends State<LiveScoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Score")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text('Match 1'),
            subtitle: Text('Match score'),
            trailing: Text('Winner:'),
          );
        },
      ),
    );
  }
}
