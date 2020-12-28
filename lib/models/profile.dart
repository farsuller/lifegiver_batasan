
import 'package:flutter/foundation.dart';

class Profile {
  final String userId;
  final String documentId;
  final String fullName;
  final String leader;
  final String lifegroup;
  final String network;
  final String platform;

  Profile({
    @required this.userId,
    @required this.documentId,
    @required this.fullName,
    @required this.leader,
    @required this.lifegroup,
    @required this.network,
    @required this.platform,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'leader': leader,
      'lifegroup': lifegroup,
      'network': network,
      'platform': platform,
    };
  }

  static Profile fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Profile(
      fullName: map['fullName'],
      leader: map['leader'],
      lifegroup: map['lifegroup'],
      network: map['network'],
      platform: map['platform'],
      userId: map['userId'],
      documentId: documentId,
    );
  }
}
