import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/home_tiles.dart';

import 'components/featured_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      height: context.screenHeight,
      width: context.screenWidth,
      // padding: const EdgeInsets.all(16),
      child: SafeArea(
          child: Column(
        children: [
          // search bar
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: kBoxShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  suffixIcon: Icon(
                    Icons.search,
                    color: fontGrey,
                  ),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: fontGrey,
                  ),
                ),
              ),
            ),
          ),

          (context.screenHeight * 0.03).heightBox,

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // swiper brands
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: (context.screenHeight * 0.17),
                    enlargeCenterPage: true,
                    itemCount: homeFirstSwiperList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        homeFirstSwiperList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),

                  (context.screenHeight * 0.02).heightBox,
                  // selections
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      2,
                      (index) => homeTile(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 2.25,
                        icon: index == 0 ? icTodaysDeal : icFlashDeal,
                        label: index == 0 ? todaysDeal : flashSale,
                      ),
                    ),
                  ),

                  (context.screenHeight * 0.02).heightBox,

                  // second swiper
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: (context.screenHeight * 0.17),
                    enlargeCenterPage: true,
                    itemCount: homeSecondSwiperList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        homeSecondSwiperList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),

                  (context.screenHeight * 0.02).heightBox,

                  // top catagories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => homeTile(
                        height: context.screenHeight * 0.15,
                        width: context.screenWidth / 3.5,
                        icon: index == 0
                            ? icTopCategories
                            : index == 1
                                ? icBrands
                                : icTopSeller,
                        label: index == 0
                            ? topCatagories
                            : index == 1
                                ? brands
                                : topSellers,
                      ),
                    ),
                  ),

                  (context.screenHeight * 0.02).heightBox,

                  // featured catagories
                  Align(
                    alignment: Alignment.centerLeft,
                    child: featuredCatagories.text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semiBold)
                        .make(),
                  ).box.margin(const EdgeInsets.only(left: 16)).make(),

                  (context.screenHeight * 0.02).heightBox,

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredTile(
                                      image: featuredImages1[index],
                                      label: featuredLabels1[index],
                                      height: context.screenHeight * 0.1,
                                      width: context.screenWidth / 2.1),
                                  10.heightBox,
                                  featuredTile(
                                      image: featuredImages2[index],
                                      label: featuredLabels2[index],
                                      height: context.screenHeight * 0.1,
                                      width: context.screenWidth / 2.1),
                                ],
                              )),
                    ),
                  ),
                  (context.screenHeight * 0.02).heightBox,

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    color: redColor,
                    height: context.screenHeight * 0.3,
                    width: context.screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text
                            .color(whiteColor)
                            .fontFamily(semiBold)
                            .size(18)
                            .make()
                            .box
                            .margin(const EdgeInsets.only(left: 16))
                            .make(),
                        (context.screenHeight * 0.02).heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgB2,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        "BMW's new cars with high milage and extreme comfort and with safty measures "
                                            .text
                                            .fontFamily(regular)
                                            .size(12)
                                            .color(fontGrey)
                                            .make()
                                            .box
                                            .width(120)
                                            .make(),
                                        10.heightBox,
                                        "\$6,000"
                                            .text
                                            .color(redColor)
                                            .fontFamily(bold)
                                            .size(24)
                                            .make()
                                            .box
                                            .alignCenterLeft
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .color(whiteColor)
                                        .roundedSM
                                        // .size(150, 180)
                                        .margin(const EdgeInsets.only(left: 16))
                                        .padding(const EdgeInsets.all(12))
                                        .make()),
                          ),
                        )
                      ],
                    ),
                  ),

                  (context.screenHeight * 0.02).heightBox,
                  // third swiper
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: (context.screenHeight * 0.17),
                    enlargeCenterPage: true,
                    itemCount: homeSecondSwiperList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        homeSecondSwiperList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),

                  // all products label
                  allProducts.text
                      .size(20)
                      .fontFamily(bold)
                      .color(darkFontGrey)
                      .make()
                      .box
                      .alignCenterLeft
                      .margin(const EdgeInsets.all(16))
                      .make(),

                  // all products list
                  GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            mainAxisExtent: 300,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP3,
                            width: double.maxFinite,
                            fit: BoxFit.fill,
                          ),
                          const Spacer(),
                          "the all new sereis of laptop with high graphics and performance are here and are on discount"
                              .text
                              .size(16)
                              .color(fontGrey)
                              .make(),
                          10.heightBox,
                          "\$12,000"
                              .text
                              .size(20)
                              .color(redColor)
                              .fontFamily(bold)
                              .make(),
                        ],
                      )
                          .box
                          .padding(const EdgeInsets.all(8))
                          .color(whiteColor)
                          .roundedSM
                          .outerShadow
                          .make();
                    },
                  )
                      .box
                      .margin(const EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
