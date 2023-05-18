import 'package:flutter/material.dart';
import 'package:cyberv2/rsa/utilities/constants.dart';
import 'package:cyberv2/rsa/widgets/appbar_icon_button.dart';
import 'package:cyberv2/rsa/widgets/copy_icon_button.dart';
import 'package:cyberv2/rsa/widgets/message_bubble.dart';
import 'package:sizer/sizer.dart';

import '../utilities/rsa_brain.dart';
import 'decrypt_input_page.dart';
import 'home_page.dart';

late String _message;
late String _title;
late String _alert;


class ResultPage extends StatefulWidget {
  ResultPage({required message, required title, required alert}) {
    _message = message;
    _title = title;
    _alert = alert;
  }

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late RSABrain _myRsaBrain = RSABrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Set the elevation to 0 to remove the shadow
        backgroundColor: kMainColor, // Set the app bar color here
        toolbarHeight: 60.0,
        leading: AppBarIconButton(
          padding: EdgeInsets.only(left: 16.0),
          icon: Icons.arrow_back_ios,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CopyIconButton(
              clipboardDataText: _message,
              alertText: _alert,
              iconSize: 20.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MessageBubble(
            text: _message,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => HomePageRsa() ),
          //     );
          //   },
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white, backgroundColor: Colors.grey[800],
          //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(25.0),
          //     ),
          //   ),
          //   child: Text('Back to RSA'),
          // ),
        ],
      ),
    );
  }
}
