import 'package:emart/consts/consts.dart';
import '../../controllers/item_details_controller.dart';
import 'components/product_details_elevated_button_widget.dart';
import 'package:intl/intl.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final dynamic data;
  ItemDetail({super.key, required this.title, required this.data});
  final ItemDetailsController productController =
      Get.put(ItemDetailsController());

  final currencyFormatter = NumberFormat('#,##,###', 'en_IN');

  @override
  Widget build(BuildContext context) {
    final int priceValue = int.parse(data['p_price']);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: darkFontGrey,
        elevation: 0,
        title: title!.text.fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // the images
                  VxSwiper.builder(
                    itemCount: data['p_images'].length,
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: context.height * 0.35,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.network(
                        data['p_images'][index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  10.heightBox,

                  // the title
                  title!.text
                      .fontFamily(semiBold)
                      .size(20)
                      .make()
                      .box
                      .margin(const EdgeInsets.only(left: 12))
                      .make(),

                  10.heightBox,

                  // rating
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    size: 20,
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    maxRating: 5,
                    // stepInt: true,
                    count: 5,
                  ).box.margin(const EdgeInsets.only(left: 12)).make(),

                  10.heightBox,
                  // price
                  Row(
                    children: [
                      "\$ "
                          .text
                          .fontFamily(bold)
                          .size(18)
                          .color(redColor)
                          .make()
                          .box
                          .margin(const EdgeInsets.only(left: 12))
                          .make(),
                      currencyFormatter
                          .format(priceValue)
                          .text
                          .fontFamily(bold)
                          .size(18)
                          .color(redColor)
                          .make()
                          .box
                          .make(),
                    ],
                  ),

                  10.heightBox,

                  // chat with the seller
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          seller.text.color(fontGrey).make(),
                          5.heightBox,
                          "${data['p_seller']}"
                              .text
                              .color(fontGrey)
                              .fontFamily(semiBold)
                              .make(),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(
                          Icons.chat_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .color(lightGrey)
                      .padding(const EdgeInsets.all(16))
                      // .margin(const EdgeInsets.symmetric(horizontal: 12))
                      .make(),

                  10.heightBox,

                  // color, quentity, and pricing
                  Column(
                    children: [
                      // color
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: color.text.color(fontGrey).make(),
                            ),
                            Obx(
                              () => Row(
                                children: List.generate(
                                  data['p_colors'].length,
                                  (index) => index ==
                                          productController
                                              .currentSelectedColor.value
                                      ? VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Color(int.parse(
                                              data['p_colors'][index])))
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 8))
                                          .shadow
                                          .make()
                                          .onTap(() {
                                          productController.currentSelectedColor
                                              .value = index;
                                        })
                                      : VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Color(int.parse(
                                              data['p_colors'][index])))
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 8))
                                          .outerShadow
                                          .make()
                                          .onTap(() {
                                          productController.currentSelectedColor
                                              .value = index;
                                        }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      10.heightBox,

                      // quantity
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: quantity.text.color(fontGrey).make(),
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      productController.decreaseQuantity();
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: productController
                                                  .currentQuantity.value ==
                                              0
                                          ? lightGrey
                                          : fontGrey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: productController
                                          .currentQuantity.value.text
                                          .size(20)
                                          .make(),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      productController.increaseQuantity();
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: fontGrey,
                                    ),
                                  ),
                                  10.widthBox,
                                  "(0 $available)"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      10.heightBox,

                      // total price
                      Container(
                        height: 50,
                        color: lightGolden,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: totalPrice.text.color(fontGrey).make(),
                              ),
                              15.widthBox,
                              "\$ "
                                  .text
                                  .size(20)
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make(),
                              Obx(
                                () => currencyFormatter
                                    .format(productController
                                            .currentQuantity.value *
                                        priceValue)
                                    .text
                                    .size(20)
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .make(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 16))
                      .padding(const EdgeInsets.symmetric(vertical: 16))
                      // .size(double.maxFinite, context.height * 0.2)
                      .roundedSM
                      .color(whiteColor)
                      .outerShadowLg
                      .make(),

                  10.heightBox,

                  // description
                  description.text
                      .fontFamily(semiBold)
                      .size(18)
                      .color(darkFontGrey)
                      .make()
                      .box
                      .margin(const EdgeInsets.only(left: 16))
                      .make(),
                  10.heightBox,
                  "${data['p_description']}"
                      .text
                      .color(fontGrey)
                      .make()
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 16))
                      .make(),

                  // buttons section
                  10.heightBox,
                  ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      color: lightGrey,
                      height: 0.5,
                    ),
                    itemCount: itemDetailScreenButtonList.length,
                    itemBuilder: (context, index) => ListTile(
                      title: itemDetailScreenButtonList[index]
                          .text
                          .fontFamily(semiBold)
                          .color(darkFontGrey)
                          .make(),
                      trailing: const Icon(
                        Icons.arrow_forward_rounded,
                        color: fontGrey,
                        size: 16,
                      ),
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // item List.generate(
                    //   itemDetailScreenButtonList.length,
                    //   (index) => ListTile(
                    //     title: itemDetailScreenButtonList[index]
                    //         .text
                    //         .fontFamily(semiBold)
                    //         .color(darkFontGrey)
                    //         .make(),
                    //     trailing: const Icon(
                    //       Icons.arrow_forward_rounded,
                    //       color: fontGrey,
                    //       size: 16,
                    //     ),
                    //   ),
                    // .box
                    // .margin(const EdgeInsets.all(8))
                    // .roundedSM
                    // .outerShadow
                    // .color(whiteColor)
                    // .make(),
                  )
                      .box
                      .color(whiteColor)
                      .margin(const EdgeInsets.all(16))
                      .rounded
                      .outerShadowLg
                      .make(),

                  // products you may like section
                  10.heightBox,
                  productsYouMayAlsoLike.text
                      .color(darkFontGrey)
                      .fontFamily(semiBold)
                      .size(18)
                      .make()
                      .box
                      .margin(const EdgeInsets.only(left: 16))
                      .make(),
                  10.heightBox,

                  // products list
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgB2,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
                                  "BMW's new cars with high milage and extreme comfort and with safty measures "
                                      .text
                                      .fontFamily(regular)
                                      .size(12)
                                      .color(fontGrey)
                                      .make()
                                      .box
                                      .width(120)
                                      .make(),
                                  10.heightBox,
                                  "\$6,000"
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(24)
                                      .make()
                                      .box
                                      .alignCenterLeft
                                      .make(),
                                ],
                              )
                                  .box
                                  .color(whiteColor)
                                  .roundedSM
                                  .outerShadow
                                  // .size(150, 180)
                                  .margin(const EdgeInsets.only(
                                      left: 16, top: 8, bottom: 8))
                                  .padding(const EdgeInsets.all(12))
                                  .make()),
                    ),
                  ),
                  // bottom space to make the content visible during scrolling
                  (context.height * 0.2).heightBox,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          // bottom buttons of add to cart or to buy now
          width: context.width,
          bottom: context.height * 0.02,
          // bottom: 0,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            productDetailsElevatedButtonWidget(
              text: addToCart,
              onPress: () {
                try {
                  if (productController.currentQuantity.value == 0) {
                    productController.increaseQuantity();
                  }
                  print("start");
                  productController.addToCart(
                    sellerName: data['p_seller'],
                    color: data['p_colors']
                        [productController.currentSelectedColor.value],
                    context: context,
                    image: data['p_images'][0],
                    totalPrice:
                        productController.currentQuantity.value * priceValue,
                    quantity: productController.currentQuantity.value,
                    title: data['p_name'],
                    vendorId: data['vendor_id'],
                  );
                  print('done');
                  VxToast.show(context, msg: "Successfully added");
                } catch (e) {
                  VxToast.show(context, msg: e.toString());
                }
              },
              screenWidth: context.width,
            ),
            productDetailsElevatedButtonWidget(
              text: buyNow,
              onPress: () {},
              screenWidth: context.width,
            ),
          ]),
        ),
      ]),
    );
  }
}
