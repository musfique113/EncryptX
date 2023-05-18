import 'package:cyberv2/rsa/pages/home_page.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/styles/glitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kMainColor,
    ));
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: kMainColor,
          scaffoldBackgroundColor: kMainColor,
          platform: TargetPlatform.iOS,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent),
            ),
          ),
        ),
        home: HomeScreen(),
      );
    });
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'EncryptX',
  //     theme: ThemeData.dark().copyWith(
  //         scaffoldBackgroundColor: backgroundColor
  //     ),
  //     home: HomeScreen(),
  //   );
  // }
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
              SizedBox(height: 30),
              Text(
                'Mahfujur Rahman Musfique - 193002154',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Fahad Islam - 193002039',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Shoeb Sikder - 193002041',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
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
                  Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePageRsa() ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text('RSA'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
