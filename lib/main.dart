import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shorter/homepage.dart';
import 'package:url_shorter/provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => UriProv(),
      child: Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
