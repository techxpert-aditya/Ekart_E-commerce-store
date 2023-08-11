import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/profile_controller.dart';
import 'package:emart/views/auth_screen/login_screen.dart';

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
    currentUser = auth.currentUser;
    return userCredential;
  }

  // storing data in cloud firestore method
  storeUserData({firstName, middleName, lastName, password, email}) async {
    DocumentReference<Map<String, dynamic>> store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'password': password,
      'email': email,
      'imgUrl': '',
      'id': currentUser!.uid,
      'cartCount': "00",
      'orderCount': "00",
      'wishlistCount': "00",
    });
  }

  // sign-out method
  Future<void> signOutMethod({context}) async {
    try {
      await auth.signOut();
      Get.find<ProfileController>().onDelete();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
