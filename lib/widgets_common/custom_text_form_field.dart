import 'package:emart/consts/consts.dart';

Widget customTextFormField({
  required String? title,
  required String? hint,
  controller,
  required FormFieldValidator<String?> validator,
  bool? osecurePassword = false,
  bool showIcon = false,
  Function? onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semiBold).size(16).make(),
      5.heightBox,
      TextFormField(
        validator: validator,
        obscureText: osecurePassword!,
        // keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: showIcon
              ? IconButton(
                  onPressed: () {
                    onTap!();
                  },
                  icon: osecurePassword
                      ? const Icon(
                          Icons.visibility_off,
                          color: fontGrey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: redColor,
                        ))
              : null,
          contentPadding: const EdgeInsets.all(16),
          hintStyle: const TextStyle(
            fontFamily: semiBold,
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
