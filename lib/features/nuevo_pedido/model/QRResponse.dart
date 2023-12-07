import 'dart:convert';
QrResponse qrResponseFromJson(String str) => QrResponse.fromJson(json.decode(str));
String qrResponseToJson(QrResponse data) => json.encode(data.toJson());
class QrResponse {
  QrResponse({
      this.content, 
      this.base64,});

  QrResponse.fromJson(dynamic json) {
    content = json['content'];
    base64 = json['base64'];
  }
  String? content;
  String? base64;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['base64'] = base64;
    return map;
  }

}