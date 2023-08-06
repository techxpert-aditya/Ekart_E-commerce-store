import 'package:emart/consts/consts.dart';

Widget profileScreenItemCountCard({
  required String title,
  required int count,
  required double screenWidth,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count.text.color(darkFontGrey).size(16).fontFamily(bold).make(),
      5.heightBox,
      title.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(screenWidth / 3.5)
      .height(80)
      .padding(const EdgeInsets.all(4))
      .make();
}
