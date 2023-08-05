import 'package:get/get.dart';

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
}
