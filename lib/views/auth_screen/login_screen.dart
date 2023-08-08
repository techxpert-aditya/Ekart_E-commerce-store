import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/auth_controller.dart';
import 'package:emart/validators/validators.dart';
import 'package:emart/views/auth_screen/signup_screen.dart';
import 'package:emart/views/home_screen/home.dart';
import '../../controllers/visibility_controller.dart';
import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_text_form_field.dart';
import '../../widgets_common/custom_elevated_button.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  VisibilityController visibilityController = Get.put(VisibilityController());
  AuthController authController = Get.put(AuthController());
  ValidatorFunctions validators = ValidatorFunctions();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            Form(
              key: _formKey,
              child: Obx(
                () => Column(
                  children: [
                    customTextFormField(
                      title: email,
                      hint: emailHint,
                      controller: emailController,
                      validator: validators.validateEmail,
                    ),
                    10.heightBox,
                    customTextFormField(
                        title: password,
                        hint: passwordHint,
                        controller: passwordController,
                        validator: validators.validatePassword,
                        osecurePassword:
                            visibilityController.loginScreenPassword.value,
                        showIcon: true,
                        onTap: () {
                          visibilityController.loginScreenPassword.value =
                              !visibilityController.loginScreenPassword.value;
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: "$forgotPass ?".text.make(),
                      ),
                    ),
                    5.heightBox,
                    authController.isLogInLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : customElevatedButton(
                            label: login,
                            onPress: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  authController.isLogInLoading(true);
                                  await authController
                                      .loginMethod(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context,
                                          msg: logInSuccessfull);
                                      Get.offAll(() => Home());
                                    } else {
                                      authController.isLogInLoading(false);
                                    }
                                  });
                                } catch (e) {
                                  VxToast.show(context, msg: e.toString());
                                  authController.isLogInLoading(false);
                                }
                              }
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
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
