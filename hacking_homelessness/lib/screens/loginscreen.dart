import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/screens/user_screen.dart';
import 'package:hacking_homeless/valuesetter.dart';
import 'package:hacking_homeless/spinkit_value.dart';
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
  bool _spinner=false;
  String str;
  String start=", ";
  String end=".,";
  String DisplayErr="Initial Warning";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String loginid;
  String password;
  @override
  initState() {
    super.initState();
    _spinner=false;
  }
  @override
  void dispose() {
    super.dispose();
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Wrong Credentials",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          content: Text(
            DisplayErr,
            style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return _spinner==true?scaffy:Scaffold(
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
                onChanged: (text) {loginid = text;},//print(loginid);},

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
                    setState(() {
                      _spinner=true;
                    });
                    AuthResult result = await _auth.signInWithEmailAndPassword(
                        email: loginid,
                        password: password).catchError((onError){print(onError.toString());
                        str=onError.toString();
                        try {
                          int startIndex = str.indexOf(start);
                          int endIndex = str.indexOf(
                              end, startIndex + start.length);
                          DisplayErr=str.substring(startIndex + start.length, endIndex);
                          //print(DisplayErr);
                        }
                        catch(e)
                      {
                        DisplayErr="Unknown Error!";
                      }
                        });
                    if (result != null) {
                      print("Login Successfull");
                      setState(() {
                        _spinner=false;
                      });
                      //GetAllCurrentUserDetails();
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>UserScreen()),);
                    }
                    else
                      {
                        setState(() {
                          _spinner=false;
                        });
                        _showDialog();
                        //print("Invalid Credentials");
                      }

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
