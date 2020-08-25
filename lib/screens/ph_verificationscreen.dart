import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {

  bool _onEditing = true;
  String _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Input(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _Input(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Phone Verification',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 30,
                color: const Color (0xf5296af4),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter the 4-digits code that sent to your number',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff524949),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        VerificationCode(
          textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
          keyboardType: TextInputType.number,
          // in case underline color is null it will use primaryColor: Colors.red from Theme
          underlineColor: Colors.amber,
          length: 4,
          // clearAll is NOT required, you can delete it
          // takes any widget, so you can implement your design
          clearAll: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'clear all',
              style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.underline,
                  color: Colors.blue[700]),
            ),
          ),
          onCompleted: (String value) {
            setState(() {
              _code = value;
            });
          },
          onEditing: (bool value) {
            setState(() {
              _onEditing = value;
            });
            if (!_onEditing) FocusScope.of(context).unfocus();
          },
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: _onEditing
                ? Text('Please enter full code')
                : Text('Your code: $_code'),
          ),
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 186,
              height: 43,
              child: FlatButton(
                color: const Color (0xf5296af4),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                child:Text('Continue ',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );

  }
}
