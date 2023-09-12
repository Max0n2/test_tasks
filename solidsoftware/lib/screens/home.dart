import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solidsoftware/statics/text.dart';
import 'package:solidsoftware/statics/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Color backgroundColor;

  void colorGenerator() {
    int r = Random().nextInt(256);
    int g = Random().nextInt(256);
    int b = Random().nextInt(256);
    setState(() {
      backgroundColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  void initState() {
    colorGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        colorGenerator();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(68, 70, 71, 1),
          title: Center(
            child: GestureDetector(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(
                      text:
                          '${backgroundColor.red} ${backgroundColor.green} ${backgroundColor.blue}'));
                  var snackBarCopied = SnackBar(
                    content: Text(copiedToClipboard),
                    duration: const Duration(seconds: 1),

                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBarCopied);
                },
                child: Text(
                    '$rgb: ${backgroundColor.red} ${backgroundColor.green} ${backgroundColor.blue}')),
          ),
        ),
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                helloThere,
                style: basewhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
