import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../consts/consts.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  // controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  // image picker
  var profileImagePath = ''.obs;
  var profileImageUrl = '';
  var isLoading = false.obs;
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  // upload profile image to firebase storage
  uploadProfilephoto(context) async {
    isLoading(true);
    try {
      var fileName = basename(profileImagePath.value);
      var destination = 'images/${currentUser!.uid}/$fileName';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileImagePath.value));
      profileImageUrl = await ref.getDownloadURL();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    } finally {
      isLoading(false);
    }
  }

  updateProfile(
      {firstName,
      middleName,
      lastName,
      newPassword,
      profileImageUrl,
      context}) async {
    isLoading(true);
    try {
      var store = firestore.collection(userCollection).doc(currentUser!.uid);
      await store.set(
          {
            'firstName': firstName,
            'middleName': middleName,
            'lastName': lastName,
            'password': newPassword,
            'imgUrl': profileImageUrl,
          },
          SetOptions(
            merge: true,
          ));
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    } finally {
      isLoading(false);
    }
  }

  // update password
  updatePassword({email, oldPassword, newPassword, context}) async {
    isLoading(true);
    final cred =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    try {
      await currentUser!.reauthenticateWithCredential(cred).then((value) {
        // print(value.user!.email);
        currentUser!.updatePassword(newPassword);
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
      // print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
