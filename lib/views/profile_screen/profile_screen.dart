import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/bg_widget.dart';

import 'components/profile_screen_item_count_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return background(
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: whiteColor,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.cancel_outlined,
            //     color: whiteColor,
            //   ),
            // ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    height: 70,
                    fit: BoxFit.cover,
                  )
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
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
                        "winny Doe".text.fontFamily(semiBold).white.make(),
                        5.heightBox,
                        "winnyDoe@gmail.com".text.white.make(),
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
                    onPressed: () {},
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
                    count: 0,
                    screenWidth: context.screenWidth,
                  ),
                  profileScreenItemCountCard(
                    title: inYourWishList,
                    count: 34,
                    screenWidth: context.screenWidth,
                  ),
                  profileScreenItemCountCard(
                    title: yourOrder,
                    count: 167,
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
      ),
    );
  }
}
