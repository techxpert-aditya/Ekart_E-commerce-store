import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/custom_elevated_button.dart';
import 'package:flutter/services.dart';

Widget exitDialogue(context) {
  return Dialog(
    backgroundColor: lightGrey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm Exit"
            .text
            .fontFamily(bold)
            .size(24)
            .color(darkFontGrey)
            .make(),
        10.heightBox,
        const Divider(),
        "Are you sure you want to exit?"
            .text
            .size(16)
            .color(darkFontGrey)
            .make(),
        30.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            customElevatedButton(
              label: "No",
              onPress: () => Get.back(),
              color: redColor,
              isUsedInRow: true,
              textColor: whiteColor,
            ),
            customElevatedButton(
              label: "Yes",
              onPress: () {
                SystemNavigator.pop();
              },
              color: whiteColor,
              isUsedInRow: true,
              textColor: darkFontGrey,
            ),
          ],
        ),
      ],
    ).box.padding(const EdgeInsets.all(16)).make(),
  );
}
