import 'package:flutter/material.dart';
import 'package:flutter_locale/verifiedPage.dart';
import 'country_code_picker/country_code_picker.dart';

void main() => runApp(new VerifiedPage());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            body: new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text('Enter your mobile number',style: TextStyle(fontSize: 20.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                    child: Text(
                      "We'll send you a sms,please enter a valid phone number to verify you",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new CountryCodePicker(
                      onChanged: print,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IT',
                      favorite: ['+39', 'FR']),


                ],
              ),
            )));
  }
}
