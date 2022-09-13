import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_shorter/model/urlmodel.dart';

class UriProv extends ChangeNotifier {
  final urlcntroller = TextEditingController();

  String finalresultmsg = 'enter url to short it';

  handellink() async {
    final longurl = urlcntroller.text;

    final String shorturi = await shorturl(longurl);

    finalresultmsg = "$shorturi";

    notifyListeners();
  }

  Future shorturl(String longurl) async {
    final respnse = await http.post(
      Uri.parse('https://cleanuri.com/api/v1/shorten'),
      body: {
        "url": longurl,
      },
    );

    if (respnse.statusCode == 200) {
      print(respnse.body);
      final result = urlshortfromjson(respnse.body);

      return result.shorturl;
    } else {
      throw Exception(
        'faild -----------${respnse.statusCode}',
      );
    }
  }
}
