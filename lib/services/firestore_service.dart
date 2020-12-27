import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lifegiver_batasan/models/batasan_user.dart';


class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

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
}
