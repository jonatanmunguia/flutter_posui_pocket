import 'dart:convert';

import 'package:flutter_posui_pocket/features/nuevo_pedido/model/ProductModel.dart';
NuevoPedidoRequest nuevoPedidoRequestFromJson(String str) => NuevoPedidoRequest.fromJson(json.decode(str));
String nuevoPedidoRequestToJson(NuevoPedidoRequest data) => json.encode(data.toJson());
class NuevoPedidoRequest {
  NuevoPedidoRequest({
      this.cartId, 
      this.products, 
      this.discount, 
      this.taxes, 
      this.shipping, 
      this.totalPrice, 
      this.successUrl, 
      this.errorUrl, 
      this.webHookUrl, 
      this.sellsAgentId,});

  NuevoPedidoRequest.fromJson(dynamic json) {
    cartId = json['cartId'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductModel.fromJson(v));
      });
    }
    discount = json['discount'] != null ? Discount.fromJson(json['discount']) : null;
    taxes = json['taxes'] != null ? Taxes.fromJson(json['taxes']) : null;
    shipping = json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    totalPrice = json['totalPrice'];
    successUrl = json['successUrl'];
    errorUrl = json['errorUrl'];
    webHookUrl = json['webHookUrl'];
    sellsAgentId = json['sellsAgentId'];
  }
  String? cartId;
  List<ProductModel>? products;
  Discount? discount;
  Taxes? taxes;
  Shipping? shipping;
  int? totalPrice;
  String? successUrl;
  String? errorUrl;
  String? webHookUrl;
  int? sellsAgentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cartId'] = cartId;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (discount != null) {
      map['discount'] = discount?.toJson();
    }
    if (taxes != null) {
      map['taxes'] = taxes?.toJson();
    }
    if (shipping != null) {
      map['shipping'] = shipping?.toJson();
    }
    map['totalPrice'] = totalPrice;
    map['successUrl'] = successUrl;
    map['errorUrl'] = errorUrl;
    map['webHookUrl'] = webHookUrl;
    map['sellsAgentId'] = sellsAgentId;
    return map;
  }

}

Shipping shippingFromJson(String str) => Shipping.fromJson(json.decode(str));
String shippingToJson(Shipping data) => json.encode(data.toJson());
class Shipping {
  Shipping({
      this.title, 
      this.price,});

  Shipping.fromJson(dynamic json) {
    title = json['title'];
    price = json['price'];
  }
  String? title;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['price'] = price;
    return map;
  }

}

Taxes taxesFromJson(String str) => Taxes.fromJson(json.decode(str));
String taxesToJson(Taxes data) => json.encode(data.toJson());
class Taxes {
  Taxes({
      this.price, 
      this.title,});

  Taxes.fromJson(dynamic json) {
    price = json['price'];
    title = json['title'];
  }
  double? price;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['title'] = title;
    return map;
  }

}

Discount discountFromJson(String str) => Discount.fromJson(json.decode(str));
String discountToJson(Discount data) => json.encode(data.toJson());
class Discount {
  Discount({
      this.title, 
      this.price,});

  Discount.fromJson(dynamic json) {
    title = json['title'];
    price = json['price'];
  }
  String? title;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['price'] = price;
    return map;
  }

}
