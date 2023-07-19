import 'package:emart/consts/consts.dart';

Widget customTextFormField(
    {required String? title,
    required String? hint,
    controller,
    bool? boolObsecure}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: boolObsecure ?? false,
        // keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          ),
        ),
      ),
    ],
  );
}
