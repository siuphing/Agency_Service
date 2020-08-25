import 'package:flutter/material.dart';

class SelectLocationScreen extends StatefulWidget {
  @override
  _SelectLocationScreenState createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }

  Widget _arrow() {
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          onPressed: (){},
        ),
      ),
    );
  }

  Widget _pinIcon(){
    return Container(
      width: 40,
      height: 40,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.map),
          color: Colors.blue.shade200,
          onPressed: (){},
        ),
      ),
    );
  }

  Widget _inputLocation(){
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
        child: Container(
          height: 100,
          alignment: Alignment.bottomCenter,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.my_location,
                    color: Colors.cyan,
                    size: 24,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 30,
                        child: TextField(
//                          controller: _textController,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Meet me at ...',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

              ),
              const Divider(
                color: Colors.grey,
                indent: 35,
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pin_drop,
                    color: Colors.deepOrangeAccent,
                    size: 25,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 250,
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'I\'am going to ....',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addLocation (String typeName){
    return Container(
      child: Center(
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }

}
