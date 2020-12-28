import 'package:flutter/foundation.dart';


class Leaders {
  final String documentId;
  final String name;
  final String lifegroup;

  Leaders({
    @required this.documentId,
    @required this.lifegroup,
    @required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'lifegroup': lifegroup,
      'name': name,
    };
  }

  static Leaders fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Leaders(
      name: map['name'],
      lifegroup: map['lifegroup'],
      documentId: documentId,
    );
  }
}