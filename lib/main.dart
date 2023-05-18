import 'package:cyberv2/styles/glitch.dart';
import 'package:flutter/material.dart';
import 'affine_cipher.dart';
import 'caesar_cipher.dart';
import 'constants.dart';
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
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(child: const Text("Encrypt-X" ,style: TextStyle(fontWeight: FontWeight.w900 , fontSize: 30),)),
              // Text(
              //   'EncryptX',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CaesarCipherScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text('Caesar Cipher'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AffineCipherScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text('Affine Cipher'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayfairCipherScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text('Playfair Cipher'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
