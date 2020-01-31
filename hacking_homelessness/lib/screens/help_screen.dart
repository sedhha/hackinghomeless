import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/help/help.png'),
            fit:BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }
}
