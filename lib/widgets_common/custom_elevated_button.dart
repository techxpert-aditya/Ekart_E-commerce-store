import 'package:emart/consts/consts.dart';

Widget customElevatedButton(
    {required String? label,
    required Function()? onPress,
    Color? color,
    Color? textColor}) {
  return SizedBox(
    width: double.maxFinite,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          padding: const EdgeInsets.all(12),
        ),
        onPressed: onPress,
        child: label!.text.color(textColor).fontFamily(bold).make()),
  );
}
