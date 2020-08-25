import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _header(),
//              SizedBox(height: 100,),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  _formInput(),
//              SizedBox(height: 50,),
                  _footer(),
                ]
             ),
            ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _header(){
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              Container(
                width: 290,
                height: 100,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("images/Image_icon.png")),
                ),
                child: Center(
                  child: Text('Agency Services', style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 25,
                      color: Colors.blue,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 1.0,
                          color: Color.fromARGB(145, 145, 145, 145),
                        )
                      ]
                  ),),
                ),
              ),
            ],
          ),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//            Text('Welcome',
//              style: TextStyle(
//                fontFamily: 'Helvetica Neue',
//                fontSize: 40,
//                color: const Color (0xf5296af4),
//              ),
//            ),
//          ],
//        ),
//        SizedBox(height: 10,),
//        Text('Log in with your Email and Password',
//          style: TextStyle(
//            fontFamily: 'Helvetica Neue',
//            fontSize: 12,
//            color: const Color(0xff524949),
//          ),
//        )
        ],
      ),
    );
  }

  Widget _formInput(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 40,
                color: const Color (0xf5296af4),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Enter your mobile number to continue',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff524949),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            CountryPickerDropdown(
              initialValue: 'JP',
              itemBuilder: _buildDropdownItem,
              priorityList:[
                CountryPickerUtils.getCountryByIsoCode('GB'),
                CountryPickerUtils.getCountryByIsoCode('CN'),
              ],
              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
              onValuePicked: (Country country) {
                print("${country.name}");
              },
            ),
            Expanded(
              child: _phone(),),
          ],
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

  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );

  Widget _phone(){
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: ' Phone Number',
      ),
    );
  }

  Widget _footer(){
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Text('Or connect with ',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 14,
            color: const Color(0xff524949),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/facebook.png")),
              ),
            ),
            SizedBox(width: 15,),
            Container(
              height: 50,
              width: 50,
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/google.png")),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        RichText(
          text: TextSpan(
              text: 'Dont have an account? ',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 14,
                color: const Color(0xff524949),
              ),
              children: <TextSpan>[
                TextSpan(text: 'Sign up',
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

}