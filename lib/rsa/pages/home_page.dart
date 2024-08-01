import 'package:cyberv2/rsa/pages/decrypt_input_page.dart';
import 'package:cyberv2/rsa/pages/public_key_input_page.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:cyberv2/rsa/widgets/copy_icon_button.dart';
import 'package:flutter/material.dart';

class HomePageRsa extends StatefulWidget {
  const HomePageRsa({super.key});

  @override
  State createState() => _HomePageRsaState();
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
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
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    _myRsaBrain.getOwnPublicKey().toString(),
                    textAlign: TextAlign.justify,
                    style: kPublicKeyDataTextStyle,
                  ),
                ),
              ),
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
                child: const Text('Encrypt'),
              ),
              const SizedBox(
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
                child: const Text('Decrypt'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
