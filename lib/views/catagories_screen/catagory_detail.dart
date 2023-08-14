import 'package:emart/consts/consts.dart';
import 'package:emart/services/firestore_service.dart';
import 'package:emart/widgets_common/bg_widget.dart';

import '../../controllers/product_controller.dart';
import '../item_screen/item_detail.dart';

class CatagoryDetail extends StatelessWidget {
  final String title;
  const CatagoryDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return background(
        child: Scaffold(
      appBar: AppBar(
        title: title.text.make(),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FireStoreService.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Products Found"
                  .text
                  .color(darkFontGrey)
                  .size(20)
                  .fontFamily(semiBold)
                  .make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                          controller.subCatagories.length,
                          (index) => controller.subCatagories[index]
                              .toString()
                              .text
                              .fontFamily(semiBold)
                              .color(fontGrey)
                              .align(TextAlign.center)
                              .makeCentered()
                              .box
                              .white
                              .size(120, 50)
                              .margin(const EdgeInsets.only(right: 8))
                              .padding(const EdgeInsets.all(8))
                              .roundedSM
                              .make()),
                    ),
                  ),
                  30.heightBox,
                  Expanded(
                    child: GridView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              data[index]['p_images'][0],
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                            ).box.height(175).make(),
                            10.heightBox,
                            "${data[index]['p_name']}"
                                .text
                                .size(24)
                                .color(darkFontGrey)
                                .fontFamily(semiBold)
                                .make(),
                            const Spacer(),
                            // 10.heightBox,
                            "${data[index]['p_description']}"
                                .text
                                .maxLines(3)
                                .ellipsis
                                .size(context.height * 0.015)
                                .color(fontGrey)
                                .make(),
                            10.heightBox,
                            "${data[index]['p_price']}"
                                .numCurrency
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
                                title: "${data[index]['p_name']}",
                                data: data[index],
                              ));
                        });
                      },
                    ).box.make(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
