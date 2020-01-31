import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:hacking_homeless/allvalues.dart';
class SpinKitDemo extends StatefulWidget {
  @override
  _SpinKitDemoState createState() => _SpinKitDemoState();
}
class _SpinKitDemoState extends State<SpinKitDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background_Color,
      body:Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
Widget scaffy=Scaffold(
backgroundColor: Background_Color,
body:Center(
child:SpinKitDoubleBounce(
color: AppBarButtonColor,
size: 50.0,
),
),
);