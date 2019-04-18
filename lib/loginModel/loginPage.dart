import 'package:flutter/material.dart';
// import 'package:testlogin/LoginModel/passwordLoginPage.dart';
import 'dart:async';
class loginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _loginPageState();
  }
}


class _loginPageState extends State<loginPage>{

  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  Timer _timer;

  String _verityStr = '获取验证码';

  int _secend = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _verityStr = '获取验证码';
    super.dispose();
  }

  _startTimer(){

    print('------_startTimer----');
    _secend = 10;

    _timer = new Timer.periodic(new Duration(seconds: 1), (time){
        if(_secend == 0){
          _cancelTimer();
          return;
        }

        _secend--;

        _verityStr = '$_secend(s)';
        setState(() {
          
        });

        if(_secend == 0){

          _verityStr = '重新发送';

        }

    });
  }

  _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Widget _buildUserImage()
  {
    return new Container(
      margin: EdgeInsets.only(bottom: 30),

      child: new Image(

        width: 100,
        height: 100,
        image: new AssetImage('images/case_modify.png'),
          
      ) 
      
    ); 
  }

  Widget _buildPhoneController(){


    return new TextField(
      // maxLength: 11,
      controller: phoneController,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        hintText: '请输入的手机号码',
        hintStyle: new TextStyle(
         color: Colors.white,
         fontSize:15 
        ),
        fillColor: Color.fromARGB(255, 69, 182, 255),
        filled: true,
        // errorText: '手机号码不正确',
        // helperText: '请输入用户名'
        // 文本内置图片
        prefixIcon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
              Radius.circular(20)
          )),
        ),
      autofocus: false,
    );
  }

  Widget _buildPassWordController(){

    Widget verifyCode = new TextField(
        controller: passWordController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.go,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 69, 182, 255),
          filled: true,
          hintStyle: new TextStyle(
            color: Colors.white,
            fontSize:15 
          ),
          contentPadding: EdgeInsets.all(10.0),
          hintText: '请输入短信验证码',
          prefixIcon: Icon(Icons.vpn_key),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20)
            ),
          ),
        ),
          obscureText: true,
          autofocus: false,
    );

    Widget verifyButton = new InkWell(
      onTap: (_secend == 0)
      ? (){

        print('_secend = $_secend');
        setState(() {
          _startTimer();
        });
      }:null,

      child: new Container(
        alignment: Alignment.center,
        width: 100,
        height: 48,
        child: new Text(
          '$_verityStr',
          style: new TextStyle(fontSize: 15.0,color: Colors.white)
        ),
      ),
    );

    return new Padding(
        padding: const EdgeInsets.only(top: 20),
        child: new Stack(
          children: <Widget>[
            verifyCode,
            new Align(
              alignment: Alignment.centerRight,
              child: verifyButton,
            )
          ],
        ),
    );
}

  Widget _buildLoginButton(){
    return new Container(
      width:  500,
      height: 40,
      margin: const EdgeInsets.only(top: 30),
                    
      child: MaterialButton(
          child: Padding(
          padding: EdgeInsets.all(10.0),
              child: Text('登录'),
          ),
          onPressed: _jumpNextController,
          textColor: Color.fromARGB(255, 0,139, 255),
          color: Colors.white,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          side:BorderSide(
            color: Color(0xFFFFFFFF),
            style: BorderStyle.solid,
            width: 2,
          )
        ),  
      ),
    );
  }
  
  Widget _builLoginModel(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      new Container(
        // margin: const EdgeInsets.only(left: 5),
        // width: 100,
        child: new MaterialButton(
        textColor: Colors.white, //该属性要求 onPressed 不能为nil
        child: Text('密码登录'),
        onPressed: (){
          print('密码登录');
          // Navigator.push(context, MaterialPageRoute(builder: (context) => DetialController()));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => new passwordPage()));
        },
        ),
        ),
        new Container(
          // margin: const EdgeInsets.only(left: 100),
          // width: 100,
          child: new MaterialButton(
          textColor: Colors.white,
          child: Text('用户注册'),
          onPressed: (){
            print('用户注册');
          },
          )) ],
    );
  }

  Widget _buildFastLogin(){
    return new Container(
      margin: const EdgeInsets.only(top: 50,bottom: 20),
      child:  new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[

          Expanded(
              flex: 1,
              child: new Divider(height: 1.0,color: Colors.white,), 
          ),
          
          new Text(
            ' 快速登录 ',
            style: TextStyle(
            color: Colors.white,
            // textBaseline: TextBaseline.alphabetic,
            // decoration: TextDecoration.underline,
            // decorationStyle: TextDecorationStyle.wavy,
            fontSize: 15
            ),
          ),
          Expanded(
              flex: 1,
              child: new Divider(height: 1.0,color: Colors.white,), 
          ),
        ],
      ),
    );
  }
  
  Widget _buildThirdLogin(){

    return new Row(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new IconButton(
              iconSize: 50,
              icon: new Image.asset('images/appwx_logo@2x.png'),
              onPressed: (){
                print('weChat ------');
              }
            ),
            new Container(
              margin:  const EdgeInsets.only(left: 55.0),
              child: new IconButton(
                iconSize: 50,
                icon: new Image.asset('images/appwx_logo@2x.png'),
                onPressed: (){
                  print('QQ ------');
                }
              ),
            ),
            new Container(
              margin:  const EdgeInsets.only(left: 55.0),
              child: new IconButton(
                iconSize: 50,
                icon: new Image.asset('images/appwx_logo@2x.png'),
                onPressed: (){
                  print('xinlang ------');
                }
              ),
            ),
          ],
        )
      ],
    );
  }
  
  Widget _buildProtocl(){

    return new Container(
      margin: EdgeInsets.only(top: 150.0),
              child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              new Image(
                width: 10,
                height: 10,
                image: new AssetImage('images/touxiang01.jpeg'),
              ),
              new Text(
                '  我已经阅读并同意<<用户服务协议>>',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11
            ),
          )
        ],
      )
    );
  }

  void _jumpNextController(){

        print({'phone': phoneController.text, 'password': passWordController.text});
        if (phoneController.text.length != 11 || isChinaPhoneLegal(phoneController.text) == false) {
          
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('手机号码格式不对'),
              
            ));
            phoneController.clear();
          } 
        else if (passWordController.text.length == 0) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
            title: Text('请填写密码'),
          
            ));
          } 

          else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetialController()));
            phoneController.clear();
            passWordController.clear();
          }
      }

      static bool isChinaPhoneLegal(String str) {
          return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
      }
  
  Widget _buildBody()
  {
    return new Container(

      margin: EdgeInsets.only(top: 100,left: 50,right: 50),
      child: new ListView(
      
        children: <Widget>[
          _buildUserImage(),
          _buildPhoneController(),
          _buildPassWordController(),
          _buildLoginButton(),
          _builLoginModel(),
          _buildFastLogin(),
          // _buildLine(),
          _buildThirdLogin(),

          _buildProtocl(),
        ],
      ),
      
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      
      backgroundColor:Color.fromARGB(255,0, 139, 255) ,
      body: _buildBody(),
    );
  }
}


class DetialController extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Scaffold(appBar: AppBar(title: Text('详情页'),)
      );
    }
}