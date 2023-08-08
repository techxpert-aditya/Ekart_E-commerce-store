import 'package:emart/consts/consts.dart';

class AuthController extends GetxController {
  var isLogInLoading = false.obs;
  var isSignUpLoading = false.obs;
  // login method
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  // sign-up method
  Future<UserCredential?> signUpMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data in cloud firestore method
  storeUserData({name, password, email}) async {
    DocumentReference<Map<String, dynamic>> store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imgUrl': '',
      'id': currentUser!.uid
    });
  }

  // sign-out method
  Future<void> signOutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
