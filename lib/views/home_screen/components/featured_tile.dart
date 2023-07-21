import 'package:emart/consts/consts.dart';

Widget featuredTile({image, String? label, width, height}) {
  return Row(
    children: [
      Image.asset(
        image,
        height: 70,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      label!.text.fontFamily(semiBold).color(darkFontGrey).make(),
    ],
  )
      .box
      .rounded
      .size(width, height)
      .margin(
        const EdgeInsets.only(left: 8),
      )
      .white
      .outerShadowSm
      .make();
}
