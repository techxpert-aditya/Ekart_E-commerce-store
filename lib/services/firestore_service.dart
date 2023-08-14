import 'package:emart/consts/consts.dart';

class FireStoreService {
  // getting user's data from firestore
  static getUser(uid) {
    // print(uid);
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // getting products from firestore according to the catagory
  static getProducts(catagory) {
    return firestore
        .collection(productsCollection)
        .where('p_catagory', isEqualTo: catagory)
        .snapshots();
  }
}
