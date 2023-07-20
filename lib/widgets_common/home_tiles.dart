import 'package:emart/consts/consts.dart';

Widget homeTile({width, height, icon, String? label, onPress}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: kBoxShadow,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        10.heightBox,
        label!.text.fontFamily(semiBold).color(darkFontGrey).make(),
      ],
    ).box.rounded.white.size(width, height).make().onTap(onPress),
  );
}
