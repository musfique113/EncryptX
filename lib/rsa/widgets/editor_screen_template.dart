import 'package:flutter/material.dart';

import '../../constants.dart';

class EditorScreenTemplate extends StatelessWidget {
  const EditorScreenTemplate({
    super.key,
    required this.controller,
    this.maxLength,
  });

  final TextEditingController controller;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
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
              borderSide: const BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            ),
          ),
        ),
        controller: controller,
        style: const TextStyle(fontSize: 16.0),
        cursorColor: Colors.white,
        maxLines: null,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
