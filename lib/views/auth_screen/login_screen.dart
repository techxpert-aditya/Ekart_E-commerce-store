import 'package:emart/consts/consts.dart';
import 'package:emart/views/auth_screen/signup_screen.dart';
import 'package:emart/views/home_screen/home.dart';
import 'package:get/get.dart';

import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_text_form_field.dart';
import '../../widgets_common/custom_elevated_button.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            "Log in to $appname".text.fontFamily(regular).size(18).white.make(),
            50.heightBox,
            Column(
              children: [
                customTextFormField(title: email, hint: emailHint),
                10.heightBox,
                customTextFormField(
                    title: password, hint: passwordHint, boolObsecure: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: "$forgotPass ?".text.make(),
                  ),
                ),
                5.heightBox,
                customElevatedButton(
                  label: login,
                  onPress: () {
                    Get.to(() => Home());
                  },
                  color: redColor,
                  textColor: whiteColor,
                ),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                customElevatedButton(
                    label: signup,
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    },
                    color: lightGolden,
                    textColor: redColor),
                20.heightBox,
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: lightGrey, thickness: 1),
                    ),
                    loginWith.text.color(fontGrey).make(),
                    const Expanded(
                      child: Divider(color: lightGrey, thickness: 1),
                    ),
                  ],
                ),
                20.heightBox,
                Wrap(
                  spacing: 20,
                  children: List.generate(
                    socialIconList.length,
                    (index) => CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 25,
                      child: Image.asset(
                        socialIconList[index],
                        width: 30,
                      ),
                    ),
                  ),
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
