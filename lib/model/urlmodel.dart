import 'dart:convert';

import 'package:url_shorter/provider/provider.dart';

Urlmodel urlshortfromjson(String str) {
  return Urlmodel.fromjson(json.decode(str));
}

String urlShortToJson(Urlmodel data) {
  return json.encode(data.toJson());
}

class Urlmodel {
  String? shorturl;

  Urlmodel({required this.shorturl});

  Urlmodel.fromjson(Map<String, dynamic> json) {
    shorturl = json['result_url'];
  }

  Map<String, dynamic> toJson() => {
        "result_url": shorturl,
      };
}
