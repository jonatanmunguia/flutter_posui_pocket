import 'dart:convert';
ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      this.title, 
      this.imageUrl, 
      this.description, 
      this.externalId, 
      this.price, 
      this.count,});

  ProductModel.fromJson(dynamic json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    externalId = json['externalId'];
    price = json['price'];
    count = json['count'];
  }
  String? title;
  String? imageUrl;
  String? description;
  String? externalId;
  int? price;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['imageUrl'] = imageUrl;
    map['description'] = description;
    map['externalId'] = externalId;
    map['price'] = price;
    map['count'] = count;
    return map;
  }

}