import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaesarCipherScreen extends StatefulWidget {
  @override
  _CaesarCipherScreenState createState() => _CaesarCipherScreenState();
}

class _CaesarCipherScreenState extends State<CaesarCipherScreen> {
  final textController = TextEditingController();
  String resultText = '';

  void encryptText() {
    setState(() {
      final text = textController.text;
      final shift = 3; // You can change the shift value as needed

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
          String cipherChar = String.fromCharCode(
              (char.codeUnitAt(0) - 65 + shift) % 26 + 65);
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
    final shift = 3; // Shift value

    String plainText = '';
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      if (RegExp(r'[A-Za-z]').hasMatch(char)) {
        String char = text[i].toUpperCase();
        String plainChar = String.fromCharCode(
            (char.codeUnitAt(0) - 65 - shift) % 26 + 65);
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
      appBar: AppBar(
        title: Text('Caesar Cipher'),
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
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: encryptText,
                  child: Text('Encrypt'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: decryptText,
                  child: Text('Decrypt'),
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
