import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:lifegiver_batasan/models/batasan_user.dart';
import 'package:lifegiver_batasan/models/leaders.dart';
import 'package:lifegiver_batasan/models/profile.dart';


class FirestoreService {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection('users');


  Future createUser(BatasanUser user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return BatasanUser.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Future completeProfile(Profile profile) async {
    try {
      await _usersCollectionReference.add(profile.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future updateProfile(Profile profile) async {
    try {
      await _usersCollectionReference
          .document(profile.documentId)
          .updateData(profile.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
