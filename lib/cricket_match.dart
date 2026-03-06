import 'package:flutter/foundation.dart';

class CricketMatch {
  final String matchId;
  final String teamOne;
  final String teamTwo;
  final int teamOneScore;
  final int teamTwoScore;
  final int teamOneWicket;
  final int teamTwoWicket;
  final String winnerTeam;
  final bool isMatchRunning;

  CricketMatch({
    required this.matchId,
    required this.teamOne,
    required this.teamTwo,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.teamOneWicket,
    required this.teamTwoWicket,
    required this.winnerTeam,
    required this.isMatchRunning,
  });
  factory CricketMatch.fromJson(String matchId, Map<String, dynamic> json) {
    return CricketMatch(
      matchId: matchId,
      teamOne: json['teamOne'],
      teamTwo: json['teamTwo'],
      teamOneScore: json['teamOneScore'],
      teamTwoScore: json['teamTwoScore'],
      teamOneWicket: json['teamOneWicket'],
      teamTwoWicket: json['teamTwoWicket'],
      winnerTeam: json['winnerTeam'],
      isMatchRunning: json['isMatchRunning'],
    );
  }
}
