import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class EditorScreenTemplate extends StatelessWidget {
  const EditorScreenTemplate({
    required this.controller,
    this.maxLength,
  });

  final TextEditingController controller;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        top: 24.0,
        bottom: 40.0,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Enter Text",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        cursorColor: Colors.white,
        maxLines: null,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
