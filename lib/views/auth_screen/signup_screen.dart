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
  // final _formKey = GlobalKey<FormState>();
  final _formKeyStep1 = GlobalKey<FormState>();
  final _formKeyStep2 = GlobalKey<FormState>();
  final _formKeyStep3 = GlobalKey<FormState>();

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

  int _currentStep = 0;

  // whole stepper widget
  List<Step> getSteps() {
    return <Step>[
      Step(
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 0,
        title: ''.text.make(),
        content: Form(
          key: _formKeyStep1,
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
            ],
          ),
        ),
      ),
      Step(
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 1,
        title: ''.text.make(),
        content: Form(
          key: _formKeyStep2,
          child: Column(
            children: [
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
                    onPressed: () {}, child: registerWithPhone.text.make()),
              ),
            ],
          ),
        ),
      ),
      Step(
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: _currentStep >= 2,
        title: ''.text.make(),
        content: Form(
          key: _formKeyStep3,
          child: Column(
            children: [
              Obx(
                () => customTextFormField(
                    title: password,
                    hint: passwordHint,
                    validator: validator.validatePassword,
                    showIcon: true,
                    osecurePassword:
                        visibilityController.signUpScreenPassword.value,
                    controller: passwordController,
                    onTap: () {
                      visibilityController.signUpScreenPassword.value =
                          !visibilityController.signUpScreenPassword.value;
                    }),
              ),
              10.heightBox,
              Obx(
                () => customTextFormField(
                    title: reTypePassword,
                    hint: passwordHint,
                    validator: validator.validateReenterPassword,
                    showIcon: true,
                    osecurePassword:
                        visibilityController.signUpScreenReTypePassword.value,
                    controller: reTypePassowrordController,
                    onTap: () {
                      visibilityController.signUpScreenReTypePassword.value =
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
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : customElevatedButton(
                        label: signup,
                        onPress: () async {
                          if (isChecked! &&
                              _formKeyStep3.currentState!.validate()) {
                            try {
                              authController.isSignUpLoading(true);
                              if (passwordController.text ==
                                  reTypePassowrordController.text) {
                                await authController
                                    .signUpMethod(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context)
                                    .then(
                                  (value) {
                                    return authController
                                        .storeUserData(
                                            firstName: firstNameController.text,
                                            middleName:
                                                middleNameController.text,
                                            lastName: lastNameController.text,
                                            email: emailController.text,
                                            password: passwordController.text)
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
                              authController.signOutMethod(context: context);
                              VxToast.show(context, msg: e.toString());
                            } finally {
                              authController.isSignUpLoading(false);
                            }
                          }
                        },
                        color: isChecked! ? redColor : inActiveRedColor,
                        textColor: whiteColor,
                      ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

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
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: redColor,
                    ),
                  ),
                  child: Stepper(
                    type: StepperType.horizontal,
                    currentStep: _currentStep,
                    onStepContinue: () {
                      if (_currentStep == 0 &&
                          _formKeyStep1.currentState!.validate()) {
                        setState(() {
                          _currentStep += 1;
                        });
                      } else if (_currentStep == 1 &&
                          _formKeyStep2.currentState!.validate()) {
                        setState(() {
                          _currentStep += 1;
                        });
                      }
                    },
                    onStepCancel: () => _currentStep == 0
                        ? null
                        : setState(() {
                            _currentStep -= 1;
                          }),
                    controlsBuilder: (context, details) {
                      if (_currentStep != 2) {
                        return Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: details.onStepContinue,
                                  child: const Text('Next'),
                                ),
                              ),
                              10.widthBox,
                              if (_currentStep == 1)
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: details.onStepCancel,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: lightGrey,
                                      foregroundColor: redColor,
                                      elevation: 0,
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    elevation: 0,
                    physics: const BouncingScrollPhysics(),
                    onStepTapped: (step) => setState(() => _currentStep = step),
                    steps: getSteps(),
                  )
                      .box
                      .size(double.maxFinite, context.screenHeight * 0.6)
                      .make(),
                ),
                const Divider(
                  color: lightGrey,
                ),
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
                .color(whiteColor)
                .rounded
                .outerShadow
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.symmetric(horizontal: 16))
                .size(context.screenWidth * 0.8, context.screenHeight * 0.7)
                .make(),
          ],
        ),
      ),
    ));
  }
}
