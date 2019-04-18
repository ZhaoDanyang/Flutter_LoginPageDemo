import 'package:flutter/material.dart';
import 'package:flutterdemo/loginModel/loginPage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: (new loginPage()),
      // home: new Scaffold(
      //   appBar: new AppBar(
      //     title: new Text('登录页'),
      //     centerTitle: true,
      //     backgroundColor: Color.fromARGB(255,0, 139, 255),
        
      //   ),
      //   // backgroundColor: Color.fromARGB(255,0, 139, 255),

      //   body: new Center(
                  
      //     child: new Container(
             
      //       // decoration: new BoxDecoration(
      //       //     color: Color.fromARGB(255,0, 139, 255),
      //       // ),
      //       child: new TextFieldWidget(),
      //     ),
          
      
      //   ),
      // ),
    );
  }
}

