import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
String RegisterAppBarText="Register for Betterment!";
double RegisterAppBarFontSize=20.0;
Color RegisterAppBarFontColor=Colors.black;
String RegistrationNameHint="Full Name";
IconData RegisterAppBarIcon=Icons.exit_to_app;
TextStyle RegistrationTextStyle=TextStyle(
  color: Colors.black,
  backgroundColor: Colors.white,
  fontSize: 16,
  fontStyle: FontStyle.italic,
);
RoundedRectangleBorder roundedrectangle=RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0));
Color Background_Color=Color(0xFFC4C4C4);
BoxDecoration CircularBoxDecorationImage=BoxDecoration(
  shape: BoxShape.circle,
  image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('assets/images/homepage/3.jpg'),
  ),
);
SizedBox HeadingDisplay=SizedBox(
  width: 250.0,
  child: ColorizeAnimatedTextKit(
      text: ["Hacking Homelessness"],
      textStyle: TextStyle(
          fontSize: 36,
          fontFamily: "Horizon",
        fontWeight: FontWeight.bold,
      ),
      colors: [
        Color(0xFF333334),
        Color(0xFF2B2C2E),
        Colors.black87,
        Colors.black,
        Color(0xFFA4A4A4),
        Color(0xFF636369),
      ],
      textAlign: TextAlign.start,
      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
  ),
);
SizedBox Quotation=SizedBox(
width: 250.0,
child: FadeAnimatedTextKit(
text: [
"Let's be the smile for the ones who need it the most!",
],
textStyle: TextStyle(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
fontSize: 14.0,
fontFamily: "Bobbers"
),
textAlign: TextAlign.center,
alignment: AlignmentDirectional.topStart // or Alignment.topLeft
),
);
class LoginButtonTypes extends StatelessWidget {
  LoginButtonTypes({this.buttoncolor,
    @required this.buttonicon,this.onpressedoption,this.iconcolor,@required this.HeroTag});
  Color buttoncolor=Colors.white70;
  Color iconcolor=Colors.black;
  IconData buttonicon;
  Function onpressedoption=null;
  String HeroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: HeroTag,
      onPressed: onpressedoption,
      child: Icon(buttonicon,color: iconcolor,),
      backgroundColor: buttoncolor,
    );
  }
}
double sizen=60;
  Widget RowWntry = Row(
    children: <Widget>[
      SizedBox(width: 20,),
      Text('Name:- '),
      TextFormField(
        obscureText: false,
        style: RegistrationTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              left: 20, bottom: 20, top: 20, right: 20),
          hintText: RegistrationNameHint,
          hintStyle: RegistrationTextStyle.copyWith(
            color: Colors.black38,
          ),),
        cursorColor: Colors.black,
        onChanged: null,

      ),
    ],
  );
Color AppBarButtonColor=Color(0xFF747474);

