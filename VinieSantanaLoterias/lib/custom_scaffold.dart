import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key key,
      this.title,
      this.barColor,
      this.child})
      : super(key: key);

  final barColor;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Scaffold(
            appBar: AppBar(
              title: Text(title),
              backgroundColor: barColor,
            ),
            body: Container(child: child),
          )
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: barColor,
              middle: Text(title),
              actionsForegroundColor: Colors.black,
            ),
            child: Container(child: child));
  }
}
