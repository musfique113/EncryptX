import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:characters/characters.dart';

class AffineCipherScreen extends StatefulWidget {
  @override
  _AffineCipherScreenState createState() => _AffineCipherScreenState();
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
      SnackBar(content: Text('Result copied to clipboard')),
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
      appBar: AppBar(
        title: Text('Affine Cipher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            TextField(
              controller: textKeyOne,
              decoration: InputDecoration(
                labelText: 'Enter KEY 1',
              ),
            ),
            TextField(
              controller: textKeyTwo,
              decoration: InputDecoration(
                labelText: 'Enter KEY 2',
              ),
            ),
            SizedBox(height: 16.0),
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
    );
  }
}
