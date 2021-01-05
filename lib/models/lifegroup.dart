import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class Lifegroup {
  final String lifegroup;
  final String userId;
  final String documentId;

  Lifegroup({
    this.userId,
    this.documentId,
    this.lifegroup,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'lifegroup': lifegroup,
    };
  }

  static Lifegroup fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Lifegroup(
      lifegroup: map['lifegroup'],
      userId: map['userId'],
      documentId: documentId,
    );
  }
}