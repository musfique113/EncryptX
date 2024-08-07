import 'package:cyberv2/rsa/pages/message_input_page.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:cyberv2/rsa/widgets/appbar_icon_button.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

late RSABrain _myRsaBrain;

class PublicKeyInputPage extends StatefulWidget {
  PublicKeyInputPage({super.key, required RSABrain rsaBrain}) {
    _myRsaBrain = rsaBrain;
  }

  @override
  State createState() => _PublicKeyInputPageState();
}

class _PublicKeyInputPageState extends State<PublicKeyInputPage> {
  TextEditingController publicKeyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        toolbarHeight: 60.0,
        leading: AppBarIconButton(
          padding: const EdgeInsets.only(left: 16.0),
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          kPublicKeyInputPageTitle,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          AppBarIconButton(
            padding: const EdgeInsets.only(right: 16.0),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              _myRsaBrain.setReceiverPublicKey(publicKeyController.text.trim());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageInputPage(
                    rsaBrain: _myRsaBrain,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: publicKeyController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 16.0),
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
      ),
    );
  }
}
