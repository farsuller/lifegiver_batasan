import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:lifegiver_batasan/models/batasan_user.dart';
import 'package:lifegiver_batasan/models/lifegroup.dart';
import 'package:lifegiver_batasan/models/profile.dart';


class FirestoreService {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection('users');
  final CollectionReference _leadersCollectionReference = Firestore.instance.collection('leaders');
  final CollectionReference _networkCollectionReference = Firestore.instance.collection('network');

  final StreamController<List<String>> _leadersController = StreamController<List<String>>.broadcast();
  final StreamController<List<String>> _networkController = StreamController<List<String>>.broadcast();
  final StreamController<List<dynamic>> _lifegroupController = StreamController<List<dynamic>>.broadcast();
  Stream listenLeadersData(){
    _leadersCollectionReference.snapshots().listen((event) {
      var leaders = event.documents.map((e) => e.documentID).toList();

      _leadersController.add(leaders);
    });
    return _leadersController.stream;
  }

  Stream listenLifegroupData(){
    _leadersCollectionReference.snapshots().listen((event) {
      var lifegroup = event.documents
          .map((snapshot) => snapshot["lifegroup"])
          .toList();
      print("your lifegroup is $lifegroup");
      _lifegroupController.add(lifegroup);
    });
    return _lifegroupController.stream;
  }

  Stream listenNetworkData(){
    _networkCollectionReference.snapshots().listen((event) {
      var leaders = event.documents.map((e) => e.documentID).toList();

      _networkController.add(leaders);
    });
    return _networkController.stream;
  }

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
