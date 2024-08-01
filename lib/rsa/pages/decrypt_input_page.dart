import 'package:cyberv2/rsa/pages/error_page.dart';
import 'package:cyberv2/rsa/pages/result_page.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/utilities/rsa_brain.dart';
import 'package:cyberv2/rsa/widgets/appbar_icon_button.dart';
import 'package:cyberv2/rsa/widgets/editor_screen_template.dart';
import 'package:flutter/material.dart';

late RSABrain _myRsaBrain;

class DecryptInputPage extends StatefulWidget {
  DecryptInputPage({super.key, required rsaBrain}) {
    _myRsaBrain = rsaBrain;
  }

  @override
  State createState() => _DecryptInputPageState();
}

class _DecryptInputPageState extends State<DecryptInputPage> {
  TextEditingController secretMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        elevation: 0, // Set the elevation to 0 to remove the shadow
        backgroundColor: kMainColor, // Set the app bar color here
        toolbarHeight: 60.0,
        leading: AppBarIconButton(
          padding: const EdgeInsets.only(left: 16.0),
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          kDecryptButtonTitle,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          AppBarIconButton(
            padding: const EdgeInsets.only(right: 16.0),
            icon: Icons.arrow_forward_ios,
            onPressed: () {
              if (secretMessageController.text.trim() == "") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      message: kSadSmiley,
                      title: kDecryptResultPageTitle,
                      alert: kDecryptResultAlertTitle,
                    ),
                  ),
                );
              } else {
                String? message = _myRsaBrain.decryptTheGetterMessage(
                    secretMessageController.text.trim());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (message != null)
                        ? ResultPage(
                      message: message,
                      title: kDecryptResultPageTitle,
                      alert: kDecryptResultAlertTitle,
                    )
                        : const ErrorPage(
                            title: kDecryptErrorTitle,
                      description: kDecryptErrorDescription,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
        body: Container(
          height: 1000,
          color: kMainColor, // Set the background color of the body
          child: EditorScreenTemplate(
            controller: secretMessageController,
          ),
        ),
    );
  }
}
