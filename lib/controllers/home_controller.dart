import 'package:emart/consts/consts.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  var userName = ''.obs;
  var userImage = ''.obs;

  getUserInfo() async {
    try {
      await firestore
          .collection(userCollection)
          .where('id', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        userName.value = value.docs.single['firstName'];
        userImage.value = value.docs.single['imgUrl'];
      });
    } catch (e) {
      print(e);
    }
  }
}
