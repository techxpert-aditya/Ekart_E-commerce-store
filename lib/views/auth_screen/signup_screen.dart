import '../../consts/consts.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/visibility_controller.dart';
import '../../widgets_common/appLogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_elevated_button.dart';
import '../../widgets_common/custom_text_form_field.dart';
import '../home_screen/home.dart';
import 'package:emart/validators/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  final _formKey = GlobalKey<FormState>();
  ValidatorFunctions validator = ValidatorFunctions();

  final AuthController authController = Get.put(AuthController());
  final VisibilityController visibilityController =
      Get.put(VisibilityController());

  // text controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reTypePassowrordController =
      TextEditingController();

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
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          customTextFormField(
                            title: firstName,
                            hint: firstNameHint,
                            controller: firstNameController,
                            validator: validator.validateName,
                          ),
                          10.heightBox,
                          customTextFormField(
                            title: middleName,
                            hint: middleNameHint,
                            controller: middleNameController,
                            validator: validator.validateName,
                          ),
                          10.heightBox,
                          customTextFormField(
                            title: lastName,
                            hint: lastNameHint,
                            controller: lastNameController,
                            validator: validator.validateName,
                          ),
                          10.heightBox,
                          customTextFormField(
                            title: email,
                            hint: emailHint,
                            controller: emailController,
                            validator: validator.validateEmail,
                          ),
                          // 5.heightBox,
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: registerWithPhone.text.make()),
                          ),
                          // 5.heightBox,
                          Obx(
                            () => customTextFormField(
                                title: password,
                                hint: passwordHint,
                                validator: validator.validatePassword,
                                showIcon: true,
                                osecurePassword: visibilityController
                                    .signUpScreenPassword.value,
                                controller: passwordController,
                                onTap: () {
                                  visibilityController
                                          .signUpScreenPassword.value =
                                      !visibilityController
                                          .signUpScreenPassword.value;
                                }),
                          ),
                          10.heightBox,
                          Obx(
                            () => customTextFormField(
                                title: reTypePassword,
                                hint: reTypePasswordHint,
                                validator: validator.validateReenterPassword,
                                showIcon: true,
                                osecurePassword: visibilityController
                                    .signUpScreenReTypePassword.value,
                                controller: reTypePassowrordController,
                                onTap: () {
                                  visibilityController
                                          .signUpScreenReTypePassword.value =
                                      !visibilityController
                                          .signUpScreenReTypePassword.value;
                                }),
                          ),
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
                          Obx(
                            () => authController.isSignUpLoading.value
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(redColor),
                                  )
                                : customElevatedButton(
                                    label: signup,
                                    onPress: () async {
                                      if (isChecked! &&
                                          _formKey.currentState!.validate()) {
                                        try {
                                          authController.isSignUpLoading(true);
                                          if (passwordController.text ==
                                              reTypePassowrordController.text) {
                                            await authController
                                                .signUpMethod(
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                    context: context)
                                                .then(
                                              (value) {
                                                return authController
                                                    .storeUserData(
                                                        firstName:
                                                            firstNameController
                                                                .text,
                                                        middleName:
                                                            middleNameController
                                                                .text,
                                                        lastName:
                                                            lastNameController
                                                                .text,
                                                        email: emailController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text)
                                                    .then((value) {
                                                  VxToast.show(context,
                                                      msg: signUpSuccessfull);
                                                  Get.offAll(() => Home());
                                                });
                                              },
                                            );
                                          } else {
                                            VxToast.show(context,
                                                msg: "Password does not match");
                                          }
                                        } catch (e) {
                                          authController.signOutMethod(
                                              context: context);
                                          VxToast.show(context,
                                              msg: e.toString());
                                        } finally {
                                          authController.isSignUpLoading(false);
                                        }
                                      }
                                    },
                                    color: isChecked!
                                        ? redColor
                                        : inActiveRedColor,
                                    textColor: whiteColor,
                                  ),
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
                      ),
                    )
                        .box
                        .height(
                          context.screenHeight * 0.53,
                        )
                        .make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(22))
                    .size(context.screenWidth - 70, context.screenHeight * 0.6)
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
