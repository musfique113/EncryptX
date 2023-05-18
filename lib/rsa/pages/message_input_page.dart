import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/pages/result_page.dart';
import 'package:cyberv2/rsa/pages/error_page.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:cyberv2/rsa/widgets/appbar_icon_button.dart';

import '../../constants.dart';

late RSABrain _myRsaBrain;

class MessageInputPage extends StatefulWidget {
  MessageInputPage({required rsaBrain}) {
    _myRsaBrain = rsaBrain;
  }

  @override
  _MessageInputPageState createState() => _MessageInputPageState();
}

class _MessageInputPageState extends State<MessageInputPage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // Set the elevation to 0 to remove the shadow
        backgroundColor: kMainColor,
        // Set the app bar color here
        toolbarHeight: 60.0,
        leading: AppBarIconButton(
          padding: EdgeInsets.only(left: 16.0),
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          kMessageInputPageTitle,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          AppBarIconButton(
            padding: EdgeInsets.only(right: 16.0),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              String? secretMessage = _myRsaBrain.encryptTheSetterMessage(
                (messageController.text.trim().length > kMaxTextFieldLength)
                    ? messageController.text
                        .trim()
                        .substring(0, kMaxTextFieldLength)
                    : messageController.text.trim(),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (secretMessage != null)
                      ? ResultPage(
                          message: secretMessage,
                          title: kEncryptResultPageTitle,
                          alert: kEncryptResultAlertTitle,
                        )
                      : ErrorPage(
                          title: kEncryptErrorTitle,
                          description: kEncryptErrorDescription,
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: messageController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 16.0),
          decoration: InputDecoration(
            labelText: "Enter Text",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: borderColor,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
