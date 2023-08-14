import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/auth_controller.dart';
import 'package:emart/controllers/profile_controller.dart';
import 'package:emart/widgets_common/bg_widget.dart';

import '../../services/firestore_service.dart';
import 'components/profile_screen_item_count_card.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    return background(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireStoreService.getUser(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              // obtaining the data from the firestore snapshot
              var data = snapshot.data!.docs[0];
              // print(data['firstName']);
              profileController.profileImageUrl = data['imgUrl'];

              return SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                          onPressed: () {
                            profileController.firstNameController.text =
                                data['firstName'];
                            profileController.middleNameController.text =
                                data['middleName'];
                            profileController.lastNameController.text =
                                data['lastName'];

                            Get.to(() => EditProfileScreen(
                                  data: data,
                                ));
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: whiteColor,
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          data['imgUrl'] == ""
                              ? Image.asset(
                                  imgProfile,
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                                  .box
                                  .roundedFull
                                  .width(70)
                                  .clip(Clip.antiAlias)
                                  .make()
                                  .box
                                  .roundedFull
                                  .border(
                                    color: whiteColor,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  )
                                  .make()
                              : Image.network(
                                  data['imgUrl'],
                                  height: 70,
                                  fit: BoxFit.cover,
                                )
                                  .box
                                  .roundedFull
                                  .width(70)
                                  .clip(Clip.antiAlias)
                                  .make()
                                  .box
                                  .roundedFull
                                  .border(
                                    color: whiteColor,
                                    style: BorderStyle.solid,
                                    width: 1,
                                  )
                                  .make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['firstName']} ${data['lastName']}"
                                    .text
                                    .fontFamily(semiBold)
                                    .white
                                    .make(),
                                5.heightBox,
                                "${data['email']}".text.white.make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: whiteColor,
                                width: 1,
                              ),
                            ),
                            onPressed: () async {
                              Get.put(AuthController()
                                      .signOutMethod(context: context))
                                  .then((value) {
                                VxToast.show(context, msg: logInSuccessfull);
                              });
                              // Get.offAll(const LoginScreen());
                            },
                            child: logOut.text.white.make(),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          profileScreenItemCountCard(
                            title: inYourCart,
                            count: int.parse(data['cartCount']),
                            screenWidth: context.screenWidth,
                          ),
                          profileScreenItemCountCard(
                            title: inYourWishList,
                            count: int.parse(data['wishlistCount']),
                            screenWidth: context.screenWidth,
                          ),
                          profileScreenItemCountCard(
                            title: yourOrder,
                            count: int.parse(data['orderCount']),
                            screenWidth: context.screenWidth,
                          ),
                        ],
                      ),

                      40.heightBox,

                      // buttons
                      // ListView.separated(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   children: List.generate(
                      //     profileScreenButtonList.length,
                      //     (index) => ListTile(
                      //       title: profileScreenButtonList[index]
                      //           .text
                      //           .fontFamily(semiBold)
                      //           .color(darkFontGrey)
                      //           .make(),
                      //       trailing: Image.asset(
                      //         profileScreenButtonIcons[index],
                      //         height: 16,
                      //       ),
                      //     )
                      //         .box
                      //         .margin(const EdgeInsets.all(8))
                      //         .roundedSM
                      //         .outerShadow
                      //         .color(whiteColor)
                      //         .make(),
                      //   ),
                      // ),

                      ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: profileScreenButtonList[index]
                                      .text
                                      .fontFamily(semiBold)
                                      .color(darkFontGrey)
                                      .make(),
                                  leading: Image.asset(
                                    profileScreenButtonIcons[index],
                                    height: 22,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: Colors.grey,
                                );
                              },
                              itemCount: profileScreenButtonList.length)
                          .box
                          .white
                          .rounded
                          .outerShadow
                          .make(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
