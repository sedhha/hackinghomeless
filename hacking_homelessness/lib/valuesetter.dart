import 'package:flutter/cupertino.dart';
import 'allvalues.dart';
import 'package:flutter/material.dart';
import 'functionalproperties.dart';
String LoginAppBarText= 'Login to Account';
String NameofTheEvent="Sample";
String DateofTheEvent="13-July-2020";
String ProcessedEmailTags="Kids,Women";
String EventLocations="Nevada, CF";
String ContactEmailAddress="oldNGOs@welfare.com";
Color LoginAppbarColor= AppBarButtonColor;
Color LoginScaffoldBackgroundColor=Color(0xFFA4A4A4);
String Loginemailhinttext= 'Enter your Email-ID';
Function Loginonpressed= EmailNavigationpage;
String Loginpasswordhinttext= 'Enter the password.';
double LoginappBarfontSize=24;
Color LoginAppbarfontcolor=Colors.black;
Color LoginAppbarIconButtonColor=Colors.black;
IconData LoginAppbarIcon=Icons.exit_to_app;
TextStyle LoginTextStyle=TextStyle(
    fontFamily: 'Montserrat',fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,color: Colors.black);
Color LoginMainButtonColor=Color(0xFF111111);
String LoginButtonText="Login";
Widget NGO_TEMPLATE=Container(
  width: double.infinity,
  height:250,
  color: Colors.white,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 10,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text('Event: $NameofTheEvent'),
          SizedBox(height: 20,),
          Text('Date: $DateofTheEvent'),
          SizedBox(height: 20,),
          Text('Tags: $ProcessedEmailTags'),
          SizedBox(height: 20,),
          Text('Location: $EventLocations'),
          SizedBox(height: 20,),
          Text('Contact: $ContactEmailAddress'),
          
        ],
      ),
      SizedBox(width:20,),
      Container(height: 200,width: 150,
          child: Image.asset('assets/images/ngoPage/ngo.png')),
    ],
  ),
);