import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getx_practice/cricket_match.dart';

class LiveScoreHome extends StatefulWidget {
  const LiveScoreHome({super.key});

  @override
  State<LiveScoreHome> createState() => _LiveScoreHomeState();
}

class _LiveScoreHomeState extends State<LiveScoreHome> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<CricketMatch> _matchList = [];
  bool _inProgress = false;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Score")),
      body: Visibility(
        visible: !_inProgress,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: _matchList.length,
          itemBuilder: (context, index) {
            CricketMatch cricketMatch = _matchList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: _indicatorColor(cricketMatch.isMatchRunning),
                radius: 10,
              ),
              title: Text(cricketMatch.matchId),
              subtitle: Text(
                '${cricketMatch.teamOne}:${cricketMatch.teamOneScore}-${cricketMatch.teamOneWicket} \n${cricketMatch.teamTwo}: ${cricketMatch.teamTwoScore}-${cricketMatch.teamTwoWicket}',
              ),
              trailing: Text('Winner:${cricketMatch.winnerTeam}'),
            );
          },
        ),
      ),
    );
  }

  Future<void> _getData() async {
    _inProgress = true;
    setState(() {});
    _matchList.clear();
    final snapShot = await _firebaseFirestore.collection('cricket').get();
    for (DocumentSnapshot doc in snapShot.docs) {
      _matchList.add(
        CricketMatch.fromJson(doc.id, doc.data() as Map<String, dynamic>),
      );
    }
    _inProgress = false;
    setState(() {});
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
