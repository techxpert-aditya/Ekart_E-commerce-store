import 'package:emart/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: "Cart is Empty"
          .text
          .fontFamily(semiBold)
          .size(20)
          .makeCentered()
          .box
          .color(whiteColor)
          .make(),
    );
  }
}
