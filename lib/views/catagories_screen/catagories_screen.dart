import 'package:emart/consts/consts.dart';
import 'package:emart/widgets_common/bg_widget.dart';
import '../../controllers/product_controller.dart';
import 'catagory_detail.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return background(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: catagories.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
          child: GridView.builder(
              itemCount: 9,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      catagoryImages[index],
                      height: 150,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    catagoryList[index].text.align(TextAlign.center).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadowSm
                    .make()
                    .onTap(() {
                  productController.getSubCatagories(
                      title: catagoryList[index]);
                  Get.to(() => CatagoryDetail(
                        title: catagoryList[index],
                      ));
                });
              }),
        ),
      ),
    );
  }
}
