// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/profile_controller.dart';
import 'package:emart/validators/validators.dart';
import 'package:emart/widgets_common/bg_widget.dart';
import 'package:emart/widgets_common/custom_elevated_button.dart';
import 'package:emart/widgets_common/custom_text_form_field.dart';

import '../../controllers/visibility_controller.dart';

class EditProfileScreen extends StatefulWidget {
  final dynamic data;
  const EditProfileScreen({super.key, required this.data});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ValidatorFunctions validatorFunctions = ValidatorFunctions();

  // form key
  final _formKey = GlobalKey<FormState>();

  // visibility controller for the password
  VisibilityController visibilityController = Get.put(VisibilityController());
  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return background(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Obx(
                            () => profileController.profileImagePath.isEmpty
                                ? widget.data['imgUrl'] != ''
                                    ? Image.network(
                                        widget.data['imgUrl'],
                                        height: context.screenHeight * 0.15,
                                        fit: BoxFit.cover,
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                        .box
                                        .roundedFull
                                        .border(
                                          color: redColor,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        )
                                        .make()
                                    : Image.asset(
                                        imgProfile,
                                        height: context.screenHeight * 0.15,
                                        fit: BoxFit.cover,
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                        .box
                                        .roundedFull
                                        .border(
                                          color: redColor,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        )
                                        .outerShadowLg
                                        .make()
                                : Image.file(
                                    File(profileController
                                        .profileImagePath.value),
                                    height: context.screenHeight * 0.15,
                                    fit: BoxFit.cover,
                                  )
                                    .box
                                    .roundedFull
                                    .clip(Clip.antiAlias)
                                    .make()
                                    .box
                                    .roundedFull
                                    .border(
                                      color: redColor,
                                      style: BorderStyle.solid,
                                      width: 2,
                                    )
                                    .make(),
                          ).box.size(150, 150).make().onTap(() {
                            Get.find<ProfileController>().changeImage(context);
                          }),

                          // change image button
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                Get.find<ProfileController>()
                                    .changeImage(context);
                              },
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                color: whiteColor,
                                size: 20,
                              ),
                            )
                                .box
                                .roundedFull
                                .color(redColor)
                                .size(40, 40)
                                .make(),
                          ),
                        ],
                      ),
                      10.heightBox,
                      // customElevatedButton(
                      //   label: change,
                      //   onPress: () {
                      //     Get.find<ProfileController>().changeImage(context);
                      //   },
                      //   color: redColor,
                      //   textColor: whiteColor,
                      // ),
                      const Divider(),

                      // rest of the fields
                      customTextFormField(
                        title: firstName,
                        hint: firstNameHint,
                        validator: validatorFunctions.validateName,
                        controller: profileController.firstNameController,
                      ),
                      10.heightBox,
                      customTextFormField(
                        title: middleName,
                        hint: middleNameHint,
                        validator: validatorFunctions.validateName,
                        controller: profileController.middleNameController,
                      ),
                      10.heightBox,
                      customTextFormField(
                        title: lastName,
                        hint: lastNameHint,
                        validator: validatorFunctions.validateName,
                        controller: profileController.lastNameController,
                      ),
                      10.heightBox,

                      // old password
                      Obx(
                        () => customTextFormField(
                            title: oldPassword,
                            hint: passwordHint,
                            validator: validatorFunctions.validatePassword,
                            controller: profileController.oldPasswordController,
                            osecurePassword: visibilityController
                                .editProfileScreenOldPassword.value,
                            showIcon: true,
                            onTap: () {
                              visibilityController
                                      .editProfileScreenOldPassword.value =
                                  !visibilityController
                                      .editProfileScreenOldPassword.value;
                            }),
                      ),
                      10.heightBox,
                      // new password
                      Obx(
                        () => customTextFormField(
                            title: newPassword,
                            hint: passwordHint,
                            validator: validatorFunctions.validatePassword,
                            controller: profileController.newPasswordController,
                            osecurePassword: visibilityController
                                .editProfileScreenNewPassword.value,
                            showIcon: true,
                            onTap: () {
                              visibilityController
                                      .editProfileScreenNewPassword.value =
                                  !visibilityController
                                      .editProfileScreenNewPassword.value;
                            }),
                      ),
                      10.heightBox,
                      Obx(
                        () => profileController.isLoading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              )
                            : customElevatedButton(
                                label: save,
                                onPress: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // // if image is not selected
                                    // if (profileController
                                    //     .profileImagePath.value.isEmpty) {

                                    // } else {
                                    //   profileController.profileImageUrl =
                                    //       widget.data['imgUrl'];
                                    // }

                                    // if old password is not correct
                                    if (profileController
                                            .oldPasswordController.text !=
                                        widget.data['password']) {
                                      VxToast.show(context,
                                          msg: "Old password is not correct!");
                                    } else {
                                      await profileController.updatePassword(
                                        context: context,
                                        email: widget.data['email'],
                                        newPassword: profileController
                                            .newPasswordController.text,
                                        oldPassword: profileController
                                            .oldPasswordController.text,
                                      );
                                      await profileController
                                          .uploadProfilephoto(context);
                                      await profileController.updateProfile(
                                          firstName: profileController
                                              .firstNameController.text,
                                          middleName: profileController
                                              .middleNameController.text,
                                          lastName: profileController
                                              .lastNameController.text,
                                          newPassword: profileController
                                              .newPasswordController.text,
                                          profileImageUrl:
                                              profileController.profileImageUrl,
                                          context: context);
                                      VxToast.show(context,
                                          msg: profileUpdated);
                                      Get.back();
                                    }
                                  }
                                },
                                color: redColor,
                                textColor: whiteColor,
                              ),
                      ),
                    ],
                  ),
                ).box.height(context.screenHeight * 0.7).make(),
              ],
            )
                .box
                .rounded
                .outerShadow
                .padding(const EdgeInsets.all(16))
                .margin(EdgeInsets.only(top: context.screenWidth * 0.1))
                .color(whiteColor)
                // .width(context.screenWidth * 0.8)
                .size(context.screenWidth * 0.8, context.screenHeight * 0.8)
                .make(),
          ),
        ),
      ),
    );
  }
}
