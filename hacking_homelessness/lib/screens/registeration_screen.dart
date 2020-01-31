import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/screens/user_screen.dart';
import 'package:hacking_homeless/valuesetter.dart';
import 'package:hacking_homeless/spinkit_value.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Registration_Screen();
  }
}
class Registration_Screen extends StatefulWidget {
  @override
  _Registration_ScreenState createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen>
    with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore=Firestore.instance;
  double uniform_move=40.0;
  String start=", ";
  String end=".,";
  String DisplayErr="Initial Warning";
  bool _spinner=false;
  String str;
  int errorcode=0;
  int sancheck=0;
  String Name;
  String Email;
  String Password;
  String re_Password;
  String City;
  String State;
  AnimationController controller;
  Animation<double> animation;
  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  void _showDialog(String Message,String Titles) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(Titles,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          content: Text(
            Message,
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
  void _SanitationCheck(String Name,String Pass,String RePass,String City,String State)
  {
    if(Name==null||City==null||State==null)
      {
        String DisplayErrorMessage="Please Fill the fields correctly. Name"
            "City or State can't be left blank.";
        String codetype="Dirty Form Request";
        _showDialog(DisplayErrorMessage, codetype);
      }
    else if(Pass!=RePass)
      {
        String DisplayErrorMessage="Kindly re-enter the two passwords as they don't match.";
        String codetype="Passwords don't match.";
        _showDialog(DisplayErrorMessage, codetype);
      }
    else
      sancheck=1;
    print(sancheck);
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: _spinner==true?scaffy:Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Background_Color,
        appBar: AppBar(
          backgroundColor: LoginAppbarColor,
          title: Text(RegisterAppBarText,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: RegisterAppBarFontSize,
            color: RegisterAppBarFontColor,
          ),),
          actions: <Widget>[
            IconButton(
              icon: Icon(RegisterAppBarIcon,
                color: LoginAppbarIconButtonColor,),
              onPressed: (){Navigator.pop(context);},
            ),
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 20,),
            Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Container(
                height: sizen,width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),),
                child: TextField(
                  obscureText: false,
                  style: LoginTextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 20, bottom: 20, top: 20, right: 20),
                    hintText: "Full Name",

                    hintStyle: RegistrationTextStyle.copyWith(
                      color: Colors.black38,
                    ),),
                  cursorColor: Colors.black,
                  onChanged: (text)
                  {
                    Name=text;
                    //print(text);
                  },

                ),
              ),
                  SizedBox(height: uniform_move,),
                  Container(
                    height: sizen,width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),),
                    child: TextFormField(
                      /*key: formkey,
                      validator: (value){(
                          value.length==0||!emailCharacters.hasMatch(
                              value))?"Follow Email-format.":null;},*/
                      obscureText: false,
                      style: LoginTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 20, bottom: 20, top: 20, right: 20),
                        hintText: "Email ID",
                        hintStyle: RegistrationTextStyle.copyWith(
                          color: Colors.black38,
                        ),),
                      cursorColor: Colors.black,
                      onChanged: (text)
                      {
                        Email=text;
                      },

                    ),
                  ),
                  SizedBox(height: uniform_move,),
                  Container(
                    height: sizen,width: 250,
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
                        hintText: "Password",
                        hintStyle: RegistrationTextStyle.copyWith(
                          color: Colors.black38,
                        ),),
                      cursorColor: Colors.black,
                      onChanged: (text)
                      {
                        Password=text;
                        //print(text);
                      },

                    ),
                  ),
                  SizedBox(height: uniform_move,),
                  Container(
                    height: sizen,width: 250,
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
                        hintText: "Re-enter the Password",
                        hintStyle: RegistrationTextStyle.copyWith(
                          color: Colors.black38,
                        ),),
                      cursorColor: Colors.black,
                      onChanged: (text)
                      {
                        re_Password=text;//print(text);
                      },

                    ),
                  ),
                  SizedBox(height: uniform_move,),
                  Container(
                    height: sizen,width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),),
                    child: TextFormField(
                      /*key: formkey,
                      validator: (value){
                          value.length==0?"City cannot be Empty!":null;},*/
                      obscureText: false,
                      style: LoginTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 20, bottom: 20, top: 20, right: 20),
                        hintText: "City of Residence",
                        hintStyle: RegistrationTextStyle.copyWith(
                          color: Colors.black38,
                        ),),
                      cursorColor: Colors.black,
                      onChanged: (text)
                      {
                        City=text;//print(text);
                      },

                    ),
                  ),
                  SizedBox(height: uniform_move,),
                  Container(
                    height: sizen,width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),),
                    child: TextFormField(
                      /*key: formkey,
                      validator: (value){
                        value.length==0?"State cannot be Empty!":null;},*/
                      obscureText: false,
                      style: LoginTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 20, bottom: 20, top: 20, right: 20),
                        hintText: "State of Residence",
                        hintStyle: RegistrationTextStyle.copyWith(
                          color: Colors.black38,
                        ),),
                      cursorColor: Colors.black,
                      onChanged: (text)
                      {
                        State=text;//print(text);
                      },

                    ),
                  ),
                ],
              ),
            SizedBox(width: 50,),
            ClipOval(
              child: Material(
                color: LoginMainButtonColor, // button color
                child: InkWell(
                  splashColor: Background_Color, // inkwell color
                  child: SizedBox(width: 80, height: 80, child: Center(child: Text("Go"
                  ,style: LoginTextStyle.copyWith(fontSize:32,color: Colors.white,),))),
                  onTap: () async{
                    setState(() {
                      _spinner=true;
                    });
                    _SanitationCheck(Name, Password, re_Password, City, State);
                    if(sancheck==1) {
                      AuthResult result = await _auth
                          .createUserWithEmailAndPassword(
                          email: Email, password: Password).catchError((
                          onError) {
                        errorcode = 1;
                        print(onError.toString());
                        str = onError.toString();
                        try {
                          setState(() {
                            _spinner = false;
                          });
                          int startIndex = str.indexOf(start);
                          int endIndex = str.indexOf(
                              end, startIndex + start.length);
                          DisplayErr = str.substring(
                              startIndex + start.length, endIndex);
                          _showDialog(DisplayErr, "Incorrect Credentials");
                        }
                        catch (e) {
                          setState(() {
                            _spinner = false;
                          });
                          DisplayErr = "Unknown Error!";
                          _showDialog(DisplayErr, "Incorrect Credentials");
                        }
                      });
                    }
                    //print("Registration SUccess!");
                    if(errorcode==0&&sancheck==1) {
                      _firestore.collection('UserDetails').add({
                        'City':City,'Name':Name,'State':State,
                        'RewardPoints':0,'Email':Email,
                        'Role':false,
                      });

                      _showDialog(
                          "You can now close this window to go back and login.",
                          "Success!");
                    }
                    setState(() {
                      _spinner=false;
                    });
                  },
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
