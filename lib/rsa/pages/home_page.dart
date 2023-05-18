import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/pages/decrypt_input_page.dart';
import 'package:cyberv2/rsa/pages/public_key_input_page.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/widgets/copy_icon_button.dart';
import 'package:cyberv2/rsa/widgets/navigation_button.dart';

class HomePageRsa extends StatefulWidget {
  @override
  _HomePageRsaState createState() => _HomePageRsaState();
}

class _HomePageRsaState extends State<HomePageRsa> {
  late RSABrain _myRsaBrain;

  @override
  void initState() {
    super.initState();
    _myRsaBrain = RSABrain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            top: 32.0, // Adjust the value as needed
            bottom: 160.0, // Adjust the value as needed
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        kPublicKeyTitle,
                        style: kBigTextStyle,
                      ),
                    ),
                    CopyIconButton(
                      clipboardDataText: _myRsaBrain.getOwnPublicKey().toString(),
                      alertText: kPublicKeyAlertTitle,
                      iconSize: 23.5,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Text(
                      _myRsaBrain.getOwnPublicKey().toString(),
                      textAlign: TextAlign.justify,
                      style: kPublicKeyDataTextStyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PublicKeyInputPage(
                              rsaBrain: _myRsaBrain,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 36.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text('Encrypt'),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DecryptInputPage(
                              rsaBrain: _myRsaBrain,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 36.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text('Decrypt'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
