
import 'package:flutter/foundation.dart';

class Profile {
  final String userId;
  final String documentId;
  final String fullName;
  final String leader;
  final String lifegroup;
  final String network;

  Profile({
    @required this.userId,
    @required this.documentId,
    @required this.fullName,
    @required this.leader,
    @required this.lifegroup,
    @required this.network,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'leader': leader,
      'lifegroup': lifegroup,
      'network': network,
    };
  }

  static Profile fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Profile(
      fullName: map['fullName'],
      leader: map['leader'],
      lifegroup: map['lifegroup'],
      network: map['network'],
      userId: map['userId'],
      documentId: documentId,
    );
  }
}
