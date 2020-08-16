import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final customColor;
  final Widget child;
  final String title;

  CustomScaffold(this.title, this.customColor, this.child);
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: customColor,
            ),
            body: Container(child: child),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: customColor,
              middle: Text(title),
              actionsForegroundColor: Colors.black,
            ),
            child: Container(child: child));
  }
}
