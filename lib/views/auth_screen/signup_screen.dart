import '../../consts/consts.dart';
import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_elevated_button.dart';
import '../../widgets_common/custom_text_form_field.dart';

import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return background(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogo(),
            10.heightBox,
            "Join the $appname".text.fontFamily(regular).size(18).white.make(),
            50.heightBox,
            Column(
              children: [
                customTextFormField(title: name, hint: nameHint),
                10.heightBox,
                customTextFormField(title: email, hint: emailHint),
                // 5.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: registerWithPhone.text.make()),
                ),
                // 5.heightBox,
                customTextFormField(
                    title: password, hint: passwordHint, boolObsecure: true),
                10.heightBox,
                customTextFormField(
                    title: reTypePassword, hint: reTypePasswordHint),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                      activeColor: redColor,
                      value: isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          isChecked = newValue;
                        });
                      },
                    ),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              // fontFamily: regular,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: termAndCondition,
                            style: TextStyle(
                              fontFamily: semiBold,
                              color: redColor,
                            ),
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(
                              // fontFamily: regular,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: semiBold,
                              color: redColor,
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
                10.heightBox,
                customElevatedButton(
                  label: signup,
                  onPress: () {},
                  color: isChecked! ? redColor : inActiveRedColor,
                  textColor: whiteColor,
                ),
                10.heightBox,

                // wrapping this whole richtext with gesture ditector using velocity_x
                // RichText(
                //   text: const TextSpan(
                //     children: [
                //       TextSpan(
                //           text: alreadyHaveAccount,
                //           style: TextStyle(
                //             color: fontGrey,
                //           )),
                //       TextSpan(
                //         text: login,
                //         style: TextStyle(
                //           color: redColor,
                //           fontFamily: semibold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ).onTap(() {
                //   Get.back();
                // }),

                // using row for the already have account and the login button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text
                        .color(redColor)
                        .fontFamily(semiBold)
                        .make()
                        .onTap(() {
                      Get.back();
                    }),
                  ],
                )
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(22))
                .width(context.screenWidth - 70)
                .shadowLg
                .make(),
          ],
        ),
      ),
    ));
  }
}
