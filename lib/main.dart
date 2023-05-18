import 'package:flutter/material.dart';
import 'affine_cipher.dart';
import 'caesar_cipher.dart';
import 'playfair_cipher.dart';

void main() {
  runApp(CipherApp());
}

class CipherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EncryptX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EncryptX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaesarCipherScreen()),
                );
              },
              child: Text('Caesar Cipher'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AffineCipherScreen()),
                );
              },
              child: Text('Affine Cipher'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayfairCipherScreen()),
                );
              },
              child: Text('Playfair Cipher'),
            ),
          ],
        ),
      ),
    );
  }
}
