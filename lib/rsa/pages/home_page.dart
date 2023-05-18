import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/pages/decrypt_input_page.dart';
import 'package:cyberv2/rsa/pages/public_key_input_page.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:sizer/sizer.dart';
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
            right: 7.0.w,
            left: 7.0.w,
            top: 4.0.h,
            bottom: 5.0.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 3.0.h),
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
                      iconSize: 23.5.sp,
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
                padding: EdgeInsets.only(top: 4.0.h),
                child: Column(
                  children: [
                    NavigationButton(
                      foreground: kEncryptButtonForeground,
                      background: kEncryptButtonBackground,
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
                      text: kEncryptButtonTitle,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    NavigationButton(
                      foreground: kDecryptButtonForeground,
                      background: kDecryptButtonBackground,
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
                      text: kDecryptButtonTitle,
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
