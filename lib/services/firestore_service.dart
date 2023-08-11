import 'package:emart/consts/consts.dart';

class FirebaseService {
  // getting user's data from firestore
  static getUser(uid) {
    // print(uid);
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
