import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getx_practice/cricket_match.dart';
import 'package:getx_practice/nexus_mock_screen.dart';

class LiveScoreHome extends StatefulWidget {
  const LiveScoreHome({super.key});

  @override
  State<LiveScoreHome> createState() => _LiveScoreHomeState();
}

class _LiveScoreHomeState extends State<LiveScoreHome> {
  final List<CricketMatch> _matchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Score")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cricket').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            _extractData(snapshot.data);
            return ListView.builder(
              itemCount: _matchList.length,
              itemBuilder: (context, index) {
                CricketMatch cricketMatch = _matchList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _indicatorColor(
                      cricketMatch.isMatchRunning,
                    ),
                    radius: 10,
                  ),
                  title: Text(cricketMatch.matchId),
                  subtitle: Text(
                    '${cricketMatch.teamOne}:${cricketMatch.teamOneScore}-${cricketMatch.teamOneWicket} \n${cricketMatch.teamTwo}: ${cricketMatch.teamTwoScore}-${cricketMatch.teamTwoWicket}',
                  ),
                  trailing: Text(
                    'Winner:${cricketMatch.winnerTeam == '' ? 'Pending' : cricketMatch.winnerTeam}',
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          CricketMatch cricketMatch = CricketMatch(
            matchId: 'indvspak',
            teamOne: 'Pakistan',
            teamTwo: 'India',
            teamOneScore: 256,
            teamTwoScore: 203,
            teamOneWicket: 6,
            teamTwoWicket: 9,
            winnerTeam: '',
            isMatchRunning: true,
          );
          FirebaseFirestore.instance
              .collection('cricket')
              .doc('pakvsind')
              .set(cricketMatch.toJson());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NexusMockScreen()),
          );
        },
      ),
    );
  }

  void _extractData(QuerySnapshot<Map<String, dynamic>>? snapshot) {
    _matchList.clear();
    for (DocumentSnapshot doc in snapshot?.docs ?? []) {
      _matchList.add(
        CricketMatch.fromJson(doc.id, doc.data() as Map<String, dynamic>),
      );
    }
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
