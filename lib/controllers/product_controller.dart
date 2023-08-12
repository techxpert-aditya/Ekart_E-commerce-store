import 'package:emart/consts/consts.dart';
import 'package:emart/models/catagory_model.dart';
import 'package:flutter/services.dart';

class ProductController extends GetxController {
  List subCatagories = [];

  getSubCatagories({required title}) async {
    subCatagories.clear();
    var data = await rootBundle.loadString("lib/services/catagory_model.json");
    var decodedData = catagoryModelFromJson(data);
    var s = decodedData.catagories
        .where((element) => element.name == title)
        .toList();

    for (var e in s[0].subCatagory) {
      subCatagories.add(e);
    }
  }
}
