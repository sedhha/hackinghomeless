import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/valuesetter.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Loginscreen();
  }
}
class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String loginid;
  String password;
  @override
  initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: LoginScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: LoginAppbarColor,
        title: Text(LoginAppBarText,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: LoginappBarfontSize,
          color: LoginAppbarfontcolor,
        ),),
        actions: <Widget>[
          IconButton(
            icon: Icon(LoginAppbarIcon,
            color: LoginAppbarIconButtonColor,),
            onPressed: (){Navigator.pop(context);},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 60,),
          Center(
            child: Container(
              height: 60,width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),),
              child: TextFormField(
                style: LoginTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: 20, bottom: 20, top: 20, right: 20),
                  hintText: Loginemailhinttext,hintStyle: LoginTextStyle.copyWith(
                  color: Colors.black38,
                ),),
                cursorColor: Colors.black,
                onChanged: (text) {loginid = text;print(loginid);},

              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              height: 60,width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),),
              child: TextFormField(
                obscureText: true,
                style: LoginTextStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: 20, bottom: 20, top: 20, right: 20),
                  hintText: Loginpasswordhinttext,hintStyle: LoginTextStyle.copyWith(
                  color: Colors.black38,
                ),),
                cursorColor: Colors.black,
                onChanged: (text) {password = text;},

              ),
            ),
          ),
          SizedBox(height: 50,),
          Flexible(
            child: Container(width: 250,height:50,
              child: DecoratedBox(
                decoration:
                ShapeDecoration(shape:roundedrectangle, color:LoginMainButtonColor),
                child: OutlineButton(
                  color:LoginMainButtonColor,
                  borderSide: BorderSide(color:Colors.white,),
                  shape: roundedrectangle,

                  child: Center(child: Text('Login',
                    style: TextStyle(color: Colors.white,),)),
                  onPressed: ()
                  async{
                    AuthResult result = await _auth.signInWithEmailAndPassword(
                        email: loginid, password: password);
                    if (result != null) {
                      print("Login Successfull");
                    }
                    else
                      print("Invalid Credentials");
                  },
                ),
              ),),
          ),

          ]
    ),);
  }
}

void Logout()
{
  print("Function to be defined for logging out.");
}