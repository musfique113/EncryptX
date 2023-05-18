import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11,vertical: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
