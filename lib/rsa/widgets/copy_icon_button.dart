import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({
    required this.clipboardDataText,
    required this.alertText,
    required this.iconSize,
  });

  final String clipboardDataText;
  final String alertText;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconSize,
        onPressed: () {
          Clipboard.setData(ClipboardData(text: clipboardDataText)).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  alertText,
                ),
              ),
            );
          });
        },
        icon: Icon(Icons.copy));
  }
}
