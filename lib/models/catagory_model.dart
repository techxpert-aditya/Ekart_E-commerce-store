// To parse this JSON data, do
//
//     final catagoryModel = catagoryModelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

CatagoryModel catagoryModelFromJson(String str) =>
    CatagoryModel.fromJson(json.decode(str));

class CatagoryModel {
  List<Catagory> catagories;

  CatagoryModel({
    required this.catagories,
  });

  factory CatagoryModel.fromJson(Map<String, dynamic> json) => CatagoryModel(
        catagories: List<Catagory>.from(
            json["catagories"].map((x) => Catagory.fromJson(x))),
      );
}

class Catagory {
  String name;
  List<String> subCatagory;

  Catagory({
    required this.name,
    required this.subCatagory,
  });

  factory Catagory.fromJson(Map<String, dynamic> json) => Catagory(
        name: json["name"],
        subCatagory: List<String>.from(json["subCatagory"].map((x) => x)),
      );
}
