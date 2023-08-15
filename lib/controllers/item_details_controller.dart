import 'package:emart/consts/consts.dart';

class ItemDetailsController extends GetxController {
  var currentSelectedColor = 0.obs;
  var currentQuantity = 0.obs;

  void increaseQuantity() {
    currentQuantity.value++;
  }

  void decreaseQuantity() {
    if (currentQuantity.value > 0) {
      currentQuantity.value--;
    }
  }

  addToCart(
      {context,
      title,
      totalPrice,
      color,
      image,
      quantity,
      sellerName,
      vendorId}) async {
    print("here");
    await firestore.collection(cartCollection).doc().set({
      'p_name': title,
      'p_total_price': totalPrice,
      'p_color': color,
      'p_image': image,
      'p_quantity': quantity,
      'p_user_id': currentUser!.uid,
      'p_seller': sellerName,
      'vendor_id': vendorId,
    }).catchError((e) {
      VxToast.show(context, msg: e.toString());
    });
  }
}
