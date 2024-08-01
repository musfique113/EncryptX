import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class AffineCipherScreen extends StatefulWidget {
  const AffineCipherScreen({super.key});

  @override
  State createState() => _AffineCipherScreenState();
}

class _AffineCipherScreenState extends State<AffineCipherScreen> {
  final textController = TextEditingController();
  final textKeyOne = TextEditingController();
  final textKeyTwo = TextEditingController();
  String resultText = '';

  void encryptText() {
    setState(() {
      final text = textController.text;
      final a = int.tryParse(textKeyOne.text) ?? 0; // Multiplier
      final b = int.tryParse(textKeyTwo.text) ?? 0; // Offset
      resultText = affineEncrypt(text, a, b);
    });
  }

  String affineEncrypt(String text, int a, int b) {
    // int aInverse = 0;
    // for (int i = 0; i < 26; i++) {
    //   if ((a * i) % 26 == 1) {
    //     aInverse = i;
    //     break;
    //   }
    // }
    String cipherText = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (char.isNotEmpty) {
        if (RegExp(r'[A-Za-z]').hasMatch(char)) {
          char = char.toUpperCase();
          String cipherChar = String.fromCharCode(
              ((a * (char.codeUnitAt(0) - 65) + b) % 26) + 65);
          cipherText += cipherChar;
        } else {
          cipherText += char;
        }
      }
    }
    return cipherText;
  }

  void decryptText() {
    setState(() {
      final text = textController.text;
      final a = int.tryParse(textKeyOne.text) ?? 0; // Multiplier
      final b = int.tryParse(textKeyTwo.text) ?? 0; // Offset
      resultText = affineDecrypt(text, a, b);
    });
  }

  String affineDecrypt(String cipherText, int a, int b) {
    int aInverse = 0;
    for (int i = 0; i < 26; i++) {
      if ((a * i) % 26 == 1) {
        aInverse = i;
        break;
      }
    }
    String plainText = '';
    for (int i = 0; i < cipherText.length; i++) {
      String char = cipherText[i];
      if (char.isNotEmpty) {
        if (RegExp(r'[A-Za-z]').hasMatch(char)) {
          char = char.toUpperCase();
          String plainChar = String.fromCharCode(
              (aInverse * (char.codeUnitAt(0) - b - 65) % 26) + 65);
          plainText += plainChar;
        } else {
          plainText += char;
        }
      }
    }
    return plainText;
  }

  void copyResult() {
    Clipboard.setData(ClipboardData(text: resultText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Result copied to clipboard')),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Affine Cipher',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 45),
                TextField(
                  controller: textController,
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
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: textKeyOne,
                  decoration: InputDecoration(
                    labelText: "Enter KEY 1",
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
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: textKeyTwo,
                  decoration: InputDecoration(
                    labelText: "Enter KEY 2",
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
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: encryptText,
                      child: const Text('Encrypt'),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton(
                      onPressed: decryptText,
                      child: const Text('Decrypt'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Text('Result: $resultText'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
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
