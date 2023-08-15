import 'package:emart/consts/consts.dart';
import 'package:emart/services/firestore_service.dart';
import 'package:emart/widgets_common/custom_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double cartTotalPrice = 0;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        elevation: 0,
        title:
            yourCart.text.color(darkFontGrey).size(24).fontFamily(bold).make(),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: FireStoreService.getCartItems(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(redColor),
            ));
          } else {
            if (snapshot.data.docs.isEmpty) {
              return cartIsEmpty.text
                  .color(darkFontGrey)
                  .size(30)
                  .fontFamily(semiBold)
                  .makeCentered();
            } else {
              var data = snapshot.data!.docs;
              for (int i = 0; i < data.length; i++) {
                cartTotalPrice += data[i]['p_total_price'];
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              data[index]['p_image'],
                              fit: BoxFit.cover,
                              width: context.screenWidth * 0.2,
                            ).box.clip(Clip.antiAlias).roundedSM.make(),
                            10.widthBox,
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data[index]['p_name']} (qty : ${data[index]['p_quantity']})"
                                    .text
                                    .fontFamily(semiBold)
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make(),
                                "${data[index]['p_total_price']}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semiBold)
                                    .size(20)
                                    .color(redColor)
                                    .make(),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                                color: redColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: redColor,
                              ),
                            ),
                          ],
                        )
                            .box
                            .size(double.maxFinite, context.screenHeight * 0.1)
                            .color(whiteColor)
                            .roundedSM
                            .padding(const EdgeInsets.all(8))
                            .margin(const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4))
                            .outerShadow
                            .make();
                      },
                    ),
                  ),
                  // const Spacer(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      totalPrice.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semiBold)
                          .make(),
                      cartTotalPrice.numCurrency.text
                          .color(redColor)
                          .size(20)
                          .fontFamily(bold)
                          .make()
                    ],
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 16))
                      .color(lightGolden)
                      .roundedSM
                      .padding(const EdgeInsets.all(16))
                      .make(),
                  10.heightBox,
                  customElevatedButton(
                    label: procceedToCheckout,
                    onPress: () {},
                    color: redColor,
                    textColor: whiteColor,
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                  10.heightBox,
                ],
              );
            }
          }
        },
      ),
    );
  }
}
