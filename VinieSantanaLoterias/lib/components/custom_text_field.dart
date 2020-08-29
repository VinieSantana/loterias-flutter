import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.controller,
    this.placeholder,
  }) : super(key: key);

  final TextEditingController controller;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextField(
            controller: this.controller,
            decoration: InputDecoration(labelText: this.placeholder),
          )
        : CupertinoTextField(
            controller: this.controller, placeholder: this.placeholder);
  }
}
