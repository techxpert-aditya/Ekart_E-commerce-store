import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/bg_widget.dart';

import '../item_screen/item_detail.dart';

class CatagoryDetail extends StatelessWidget {
  final String title;
  const CatagoryDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return background(
        child: Scaffold(
      appBar: AppBar(
        title: title.text.make(),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    6,
                    (index) => "baby powder"
                        .text
                        .fontFamily(semiBold)
                        .color(fontGrey)
                        .makeCentered()
                        .box
                        .white
                        .size(120, 50)
                        .margin(const EdgeInsets.only(right: 8))
                        .roundedSM
                        .make()),
              ),
            ),
            30.heightBox,
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
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
                      .make()
                      .onTap(() {
                    Get.to(() => ItemDetail(
                          title: "Dummy Title",
                        ));
                  });
                },
              ).box.make(),
            ),
          ],
        ),
      ),
    ));
  }
}
