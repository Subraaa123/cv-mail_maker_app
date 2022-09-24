import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  var _value ;
  bool enabled =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('test'),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DropdownButton(

                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text("Beginner"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Intermediate"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("Expert"),
                    value: 3,
                  ),
                ],


                onChanged: (value){
                  setState(() {
                    _value=value;
                  });


                },


                hint:Text("Select item")
            ),
          ),
          Visibility(
            visible: _value==1?true:false,
            child: TextFormField(


            ),
          )
        ],
      ),

    );
  }
}
