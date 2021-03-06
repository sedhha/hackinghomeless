import 'package:flutter/material.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/screens/loginscreen.dart';
import 'package:hacking_homeless/functionalproperties.dart';
import 'package:hacking_homeless/screens/registeration_screen.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomepage();
  }
}
class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> with TickerProviderStateMixin{
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Background_Color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50,),
          Center(
            child: Container(
              height: 250,width: 250,
              decoration: CircularBoxDecorationImage,
            ),
          ),
          SizedBox(height: 30,),
          HeadingDisplay,
          SizedBox(height: 30,),
          Quotation,
          SizedBox(height: 50,),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 20,),
              LoginButtonTypes(buttonicon: Icons.send,
                iconcolor: Colors.black,HeroTag: "Button2",
                buttoncolor: Colors.white70,
                onpressedoption: ()
                {
                  //print('Hello world');
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LoginScreen()),);
                  //Navigator.push(context,
                    //MaterialPageRoute(builder: (context)=>LoginScreen()),);
                },
                ),
              SizedBox(width: 50,),
              LoginButtonTypes(buttonicon: Icons.account_circle,
                onpressedoption: ()
                {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>RegistrationScreen()),);
                },
                HeroTag: "Button1",
                iconcolor: Colors.black,buttoncolor: Colors.white70,),
              SizedBox(width: 20,),
            ],
          ),
        ],
      ),

    );
  }
}

void PrintFunction()
{
  print('Yaha sab safe h');
}