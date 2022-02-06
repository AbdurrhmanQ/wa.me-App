<<<<<<< HEAD
import 'package:flutter/material.dart';

void main() => runApp(Wa_me_interface());

class Wa_me_interface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
=======
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Wa_me_interface());

class Wa_me_interface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WaInint(),
      theme: ThemeData(
        primaryColor: Color(0xFF00A783),
      ),
    );
  }
}

void openLink(number) async {
  var _url = "https://api.whatsapp.com/send?phone=" + number;
  if (!await launch(_url)) throw 'Could not launch $_url';
}

class WaInint extends StatefulWidget {
  @override
  _WaInintState createState() => _WaInintState();
}

class _WaInintState extends State<WaInint> {
  late TextEditingController textEditor;
  var phoneNumber = '';
  @override
  void initState() {
    super.initState();
    textEditor = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Whatsapp'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 75,
              width: 230,
              child: TextField(
                controller: textEditor,
              ),
            ),
            MaterialButton(
              onPressed: (() {
                setState(() {
                  phoneNumber = textEditor.text;
                  if (phoneNumber.length > 15) {
                    final snackBar = SnackBar(
                      content: Text('يا سبك 15 رقم اجل '),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print('object');
                  } else if (phoneNumber.startsWith('0')) {
                    phoneNumber = '966${phoneNumber.substring(1)}';
                    print(phoneNumber);
                    openLink(phoneNumber);
                  } else {
                    openLink(phoneNumber);
                  }
                });
              }),
              child: Text(
                'Message',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Color(0xFF00A783),
            )
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textEditor.dispose();
  }
}
>>>>>>> master
