import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _isHidden = true;

  void _togglePasswordVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back_ios, color: Colors.grey,),
//          onPressed: (){},
//        ),
//        backgroundColor: Colors.white,
//        title: Text('Sign Up',
//          style: TextStyle(
//            fontFamily: 'Helvetica Neue',
//            fontSize: 30,
//
//            color: const Color (0xf5296af4),
//          ),),
//        centerTitle: true,
//      ),
//      // resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 30,right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _header(),
              SizedBox(height: 20,),
              _form(),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(){
    return Row(
      children: <Widget>[
        Text('Sign Up',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color (0xf5296af4),
          ),),

      ],
    );
  }

  Widget _form(){
    return Column(
      children: <Widget>[
        _textField("Full Name"),
        SizedBox(height: 20,),
        _textField("Phone Number"),
        SizedBox(height: 20,),
        _textField("Email"),
        SizedBox(height: 20,),
        _textField("Password"),
        SizedBox(height: 20,),
        _textField("Confirm Password"),
        SizedBox(height: 20,),
        RichText(
          text: TextSpan(
              text: 'By signing up you accept the ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff524949),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Term of service',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 14,
                    color: const Color (0xf5296af4),
                  ),
                ),
                TextSpan(
                  text: ' and',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 14,
                    color: const Color(0xff524949),
                  ),
                ),
                TextSpan(
                  text: ' Privacy Policy',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 14,
                    color: const Color (0xf5296af4),
                  ),
                ),
              ]
          ),


        ),
      ],

    );
  }

  Widget _textField( String hintText){
    return TextFormField(
      keyboardType: hintText == "Email" ? TextInputType.emailAddress : hintText == "Phone Number" ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Helvetica Neue',fontSize: 16,),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: _togglePasswordVisibility,
          icon: _isHidden ?  Icon(Icons.visibility_off,) : Icon(Icons.visibility),
        ): null,
      ),
      obscureText: hintText == "Password" ? _isHidden : hintText == "Confirm Password" ? true : false,
    );
  }

  Widget _footer(){
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Container(
          width: 303,
          height: 41,
          child: FlatButton(
            color: const Color (0xf5296af4),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
            child:Text('Sign In ',
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
        SizedBox(height: 10,),
        RichText(
          text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff524949),
              ),
              children: <TextSpan>[
                TextSpan(text: 'Sign In',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color (0xf5296af4),
                  ),
                ),
              ]
          ),
        ),
      ],
    );
  }
}