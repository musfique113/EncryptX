import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class PlayfairCipherScreen extends StatefulWidget {
  const PlayfairCipherScreen({super.key});

  @override
  State createState() => _PlayfairCipherScreenState();
}

class _PlayfairCipherScreenState extends State<PlayfairCipherScreen> {
  final textController = TextEditingController();
  String resultText = '';

  void encryptText() {
    final text = textController.text.toUpperCase();
    const key = "KEY";
    String cipherText = playfairEncrypt(text, key);
    setState(() {
      resultText = cipherText;
    });
  }

  String playfairEncrypt(String text, String key) {
    // Convert input text and key to uppercase and remove non-alphabetic characters
    text = text.replaceAll(RegExp(r'[^A-Z]'), '').toUpperCase();
    key = key.replaceAll(RegExp(r'[^A-Z]'), '').toUpperCase();

    // Generate 5x5 Playfair matrix using the key
    String alphabet = 'ABCDEFGHIKLMNOPQRSTUVWXYZ'; // no 'J' in Playfair
    String matrix = key + alphabet;
    matrix = matrix.replaceAll(RegExp(r'J'), ''); // remove 'J' from matrix
    matrix = matrix.split('').toSet().toList().join(); // remove duplicates
    matrix = matrix.padRight(25, 'X'); // fill up to 25 characters with 'X'
    List<List<String>> playfairMatrix =
        List.generate(5, (i) => List.generate(5, (j) => matrix[i * 5 + j]));

    // Replace pairs of characters in input text with their corresponding cipher pairs
    String cipherText = '';
    for (int i = 0; i < text.length; i += 2) {
      String a = text[i];
      String b = i + 1 < text.length ? text[i + 1] : 'X';

      // Find row and column indices for both characters
      int? aRow, aCol, bRow, bCol;
      for (int r = 0; r < 5; r++) {
        for (int c = 0; c < 5; c++) {
          if (playfairMatrix[r][c] == a) {
            aRow = r;
            aCol = c;
          }
          if (playfairMatrix[r][c] == b) {
            bRow = r;
            bCol = c;
          }
        }
      }

      // Handle the case when variables are not assigned
      aRow ??= 0;
      aCol ??= 0;
      bRow ??= 0;
      bCol ??= 0;

      // If both characters are in the same row, replace them with the characters to their right
      if (aRow == bRow) {
        cipherText += playfairMatrix[aRow][(aCol + 1) % 5];
        cipherText += playfairMatrix[bRow][(bCol + 1) % 5];
      }
      // If both characters are in the same column, replace them with the characters below them
      else if (aCol == bCol) {
        cipherText += playfairMatrix[(aRow + 1) % 5][aCol];
        cipherText += playfairMatrix[(bRow + 1) % 5][bCol];
      }
      // If neither is true, replace them with the characters at the opposite corners of their respective rectangles
      else {
        cipherText += playfairMatrix[aRow][bCol];
        cipherText += playfairMatrix[bRow][aCol];
      }
    }
    return cipherText;
  }

  //code for dycription
  void decryptText() {
    final text = textController.text.toUpperCase();
    const key = "KEY"; // Replace with your own key
    String plainText = playfairDecrypt(text, key);
    setState(() {
      resultText = plainText;
    });
  }

  String playfairDecrypt(String text, String key) {
    // Convert input text and key to uppercase and remove non-alphabetic characters
    text = text.replaceAll(RegExp(r'[^A-Z]'), '').toUpperCase();
    key = key.replaceAll(RegExp(r'[^A-Z]'), '').toUpperCase();

    // Generate 5x5 Playfair matrix using the key
    String alphabet = 'ABCDEFGHIKLMNOPQRSTUVWXYZ'; // no 'J' in Playfair
    String matrix = key + alphabet;
    matrix = matrix.replaceAll(RegExp(r'J'), ''); // remove 'J' from matrix
    matrix = matrix.split('').toSet().toList().join(); // remove duplicates
    matrix = matrix.padRight(25, 'X'); // fill up to 25 characters with 'X'
    List<List<String>> playfairMatrix =
        List.generate(5, (i) => List.generate(5, (j) => matrix[i * 5 + j]));

    // Replace pairs of characters in input text with their corresponding plaintext pairs
    String plainText = '';
    for (int i = 0; i < text.length; i += 2) {
      String a = text[i];
      String b = i + 1 < text.length ? text[i + 1] : 'X';

      // Find row and column indices for both characters
      int aRow = 0, aCol = 0, bRow = 0, bCol = 0;
      for (int r = 0; r < 5; r++) {
        for (int c = 0; c < 5; c++) {
          if (playfairMatrix[r][c] == a) {
            aRow = r;
            aCol = c;
          }
          if (playfairMatrix[r][c] == b) {
            bRow = r;
            bCol = c;
          }
        }
      }

      // If both characters are in the same row, replace them with the characters to their left
      if (aRow == bRow) {
        plainText += playfairMatrix[aRow][(aCol + 4) % 5];
        plainText += playfairMatrix[bRow][(bCol + 4) % 5];
      }
      // If both characters are in the same column, replace them with the characters above them
      else if (aCol == bCol) {
        plainText += playfairMatrix[(aRow + 4) % 5][aCol];
        plainText += playfairMatrix[(bRow + 4) % 5][bCol];
      }
      // If neither is true, replace them with the characters at the opposite corners of their respective rectangles
      else {
        plainText += playfairMatrix[aRow][bCol];
        plainText += playfairMatrix[bRow][aCol];
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
                  'Playfair Cipher',
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
                const SizedBox(height: 35),
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
