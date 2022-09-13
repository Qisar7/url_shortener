import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_shorter/provider/provider.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UriProv>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(' url shorter '),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'url  shorter '.toUpperCase(),
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'shorten your long url Q/E '.toUpperCase(),
              style: const TextStyle(
                color: Color.fromARGB(255, 98, 98, 98),
                fontSize: 12,
              ),
            ),
            Spacer(),
            TextField(
              controller: prov.urlcntroller,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 13),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'enter url '),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${prov.finalresultmsg}'),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                            ClipboardData(text: '${prov.finalresultmsg}'))
                        // ignore: void_checks
                        .whenComplete(() {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sucsessfull Copyed ',
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    });
                  },
                  icon: const Icon(Icons.copy_outlined),
                )
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                  onPressed: () {
                    prov.handellink();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'process',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
