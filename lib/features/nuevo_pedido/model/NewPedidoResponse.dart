import 'dart:convert';
NewPedidoResponse newPedidoResponseFromJson(String str) => NewPedidoResponse.fromJson(json.decode(str));
String newPedidoResponseToJson(NewPedidoResponse data) => json.encode(data.toJson());
class NewPedidoResponse {
  NewPedidoResponse({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.date, 
      this.status, 
      this.price, 
      this.url, 
      this.loanId, 
      this.merchantId, 
      this.products, 
      this.branchId, 
      this.sellsAgentId,});

  NewPedidoResponse.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['DeletedAt'];
    date = json['date'];
    status = json['status'];
    price = json['price'];
    url = json['url'];
    loanId = json['loanId'];
    merchantId = json['merchantId'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    branchId = json['branchId'];
    sellsAgentId = json['sellsAgentId'];
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? date;
  String? status;
  int? price;
  String? url;
  int? loanId;
  int? merchantId;
  List<Products>? products;
  int? branchId;
  int? sellsAgentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['DeletedAt'] = deletedAt;
    map['date'] = date;
    map['status'] = status;
    map['price'] = price;
    map['url'] = url;
    map['loanId'] = loanId;
    map['merchantId'] = merchantId;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['branchId'] = branchId;
    map['sellsAgentId'] = sellsAgentId;
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.quantity, 
      this.description, 
      this.imageUrl, 
      this.price, 
      this.title, 
      this.externalId, 
      this.merchantPosOrderId,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['DeletedAt'];
    quantity = json['quantity'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    title = json['title'];
    externalId = json['ExternalId'];
    merchantPosOrderId = json['merchantPosOrderId'];
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? quantity;
  String? description;
  String? imageUrl;
  int? price;
  String? title;
  String? externalId;
  int? merchantPosOrderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['DeletedAt'] = deletedAt;
    map['quantity'] = quantity;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['price'] = price;
    map['title'] = title;
    map['ExternalId'] = externalId;
    map['merchantPosOrderId'] = merchantPosOrderId;
    return map;
  }

}