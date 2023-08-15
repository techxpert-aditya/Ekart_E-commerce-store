import 'package:emart/consts/consts.dart';

Widget productDetailsElevatedButtonWidget(
    {required String text,
    required Function()? onPress,
    required screenWidth}) {
  return SizedBox(
    width: screenWidth * 0.4,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: text == "Add to Cart" ? redColor : golden,
        elevation: 0,
      ),
      onPressed: onPress,
      child: text.text.color(whiteColor).fontFamily(bold).size(16).make(),
    ),
  ).box.shadow.make();

  // return Container(
  //   width: screenWidth * 0.5,
  //   height: 70,
  //   color: text == "Add to Cart" ? redColor : golden,
  //   child: Center(
  //     child: text.text.color(whiteColor).fontFamily(bold).size(20).make(),
  //   ),
  // ).onTap(() {
  //   onPressed();
  // });
}
