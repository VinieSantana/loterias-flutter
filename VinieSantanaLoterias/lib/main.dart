import 'dart:io';
import 'package:VinieSantanaLoterias/features/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Platform.isAndroid
    ? new MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
        title: "Loterias Caixa",
        theme: ThemeData(primaryColor: Colors.blue),
      )
    : new CupertinoApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
        title: "Loterias Caixa",
        theme: CupertinoThemeData(primaryColor: Colors.blue),
      ));
