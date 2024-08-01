import 'package:cyberv2/rsa/pages/home_page.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/styles/glitch.dart';
import 'package:flutter/material.dart';

import 'affine_cipher.dart';
import 'caesar_cipher.dart';
import 'playfair_cipher.dart';

void main() {
  runApp(const CipherApp());
}

class CipherApp extends StatelessWidget {
  const CipherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey[800],
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 38),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(style: BorderStyle.solid, color: Colors.transparent),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GlithEffect(
                child: Text(
              "Encrypt-X",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 50),
            )),
            const SizedBox(height: 30),
            const Text(
              'Mahfujur Rahman Musfique - 193002154',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const Text(
              'Fahad Islam - 193002039',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const Text(
              'Shoeb Sikder - 193002041',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                const Row(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CaesarCipherScreen()),
                    );
                  },
                  child: const Text('Caesar Cipher'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AffineCipherScreen()),
                    );
                  },
                  child: const Text('Affine Cipher'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayfairCipherScreen()),
                    );
                  },
                  child: const Text('Playfair Cipher'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePageRsa()),
                    );
                  },
                  child: const Text('RSA'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
