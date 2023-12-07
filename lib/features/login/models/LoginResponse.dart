import 'dart:convert';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      this.content, 
      this.error, 
      this.code,});

  LoginResponse.fromJson(dynamic json) {
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
    error = json['error'];
    code = json['code'];
  }
  Content? content;
  dynamic error;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (content != null) {
      map['content'] = content?.toJson();
    }
    map['error'] = error;
    map['code'] = code;
    return map;
  }

}

Content contentFromJson(String str) => Content.fromJson(json.decode(str));
String contentToJson(Content data) => json.encode(data.toJson());
class Content {
  Content({
      this.token,});

  Content.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}