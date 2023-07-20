import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/home_tiles.dart';

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
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
