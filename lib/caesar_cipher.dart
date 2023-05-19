import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class CaesarCipherScreen extends StatefulWidget {
  @override
  _CaesarCipherScreenState createState() => _CaesarCipherScreenState();
}

class _CaesarCipherScreenState extends State<CaesarCipherScreen> {
  final textController = TextEditingController();
  final textControllerShift = TextEditingController();
  String resultText = '';
  // final IconData myIcon;
  // final String myLabelText;
  // final bool toHide;

  void encryptText() {
    setState(() {
      final text = textController.text;
      final shift = int.tryParse(textControllerShift.text) ?? 0; // You can change the shift value as needed

      resultText = caesarCipher(text, shift);
    });
  }

  String caesarCipher(String text, int shift) {
    String cipherText = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char.isNotEmpty) {
        if (RegExp(r'[A-Za-z]').hasMatch(char)) {
          char = char.toUpperCase();
          String cipherChar =
              String.fromCharCode((char.codeUnitAt(0) - 65 + shift) % 26 + 65);
          cipherText += cipherChar;
        } else {
          cipherText += char;
        }
      }
    }

    return cipherText;
  }

  void decryptText() {
    // Implement the Caesar cipher decryption logic
    final text = textController.text;
    final shift = int.tryParse(textControllerShift.text) ?? 0; // Shift value

    String plainText = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (RegExp(r'[A-Za-z]').hasMatch(char)) {
        String char = text[i].toUpperCase();
        String plainChar =
            String.fromCharCode((char.codeUnitAt(0) - 65 - shift) % 26 + 65);
        plainText += plainChar;
      } else {
        plainText += text[i];
      }
    }
    setState(() {
      resultText = plainText;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void copyResult() {
    Clipboard.setData(ClipboardData(text: resultText));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Result copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Caeser Cipher',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 45),
                  TextField(
                    controller: textController,
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
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: textControllerShift,
                    decoration: InputDecoration(
                      labelText: "Enter Shift",
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
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: encryptText,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey[800],
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 36),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: Text('Encrypt'),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Container(
                        child: ElevatedButton(
                          onPressed: decryptText,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.grey[800],
                            padding:
                                EdgeInsets.symmetric(vertical: 15, horizontal: 36),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          child: Text('Decrypt'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Result: $resultText'),
                      ),
                      IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: copyResult,
                      ),
                    ],
                  ),
                ],

            ),
          ),
        ),
      ),
    );
  }
}
