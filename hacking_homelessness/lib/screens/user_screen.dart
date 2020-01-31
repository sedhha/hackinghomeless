import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hacking_homeless/screens/help_screen.dart';
import 'package:hacking_homeless/screens/ngo_details.dart';
import 'package:hacking_homeless/temp_values.dart';
import 'loginscreen.dart';
import 'contribution.dart';
class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return userscreen();
  }
}
class userscreen extends StatefulWidget {
  @override
  _userscreenState createState() => _userscreenState();
}
bool RoleOfAdministrator=false;
class _userscreenState extends State<userscreen>
    with TickerProviderStateMixin{

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final _collection=Firestore.instance;
  AnimationController controller;
  Animation<double> animation;
  String _NameOfCurrentUser;
  double equispacingparam=60.0;
  String _CityOfCurrentUser;
  String _StateOfCurrentUser;
  int _RewardPointsOfCurrentUser;
  void GetAllCurrentUserDetails()
  async{
    final FirebaseUser user = await _auth.currentUser().catchError((onError)
    {
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>UserScreen()),);
    });
    final datavv= await _collection.collection('UserDetails').where("Email",isEqualTo: user.email).getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((DocumentSnapshot documentSnapshot){
        setState(() {
          _NameOfCurrentUser=documentSnapshot.data['Name'];
          _CityOfCurrentUser=documentSnapshot.data['City'];
          _StateOfCurrentUser=documentSnapshot.data['State'];
          _RewardPointsOfCurrentUser=documentSnapshot.data['RewardPoints'];
          RoleOfAdministrator=documentSnapshot.data['Role'];
        });
      });
    });


  }

  @override
  initState() {
    super.initState();
    GetAllCurrentUserDetails();
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
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgC,
        appBar: AppBar(
          title: Text("Welcome ${_NameOfCurrentUser!=null?_NameOfCurrentUser:"User"}"),
          backgroundColor: dark,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            ),
            //Text('Log out'),

          ],

        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Center(child: Container(
              color: squarecolor,
              height: 250,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white70),
                        child: Icon(Icons.person,size: 80,color: Colors.blueGrey,)),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Text(_NameOfCurrentUser!=null
                        ?_NameOfCurrentUser:UserName,style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Text(_CityOfCurrentUser!=null
                        ?_CityOfCurrentUser:"Nevada",style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Text(_StateOfCurrentUser!=null
                        ?_StateOfCurrentUser:"NA",style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),),
                  ),

                ],
              ),

            ),),
            SizedBox(height: 30,),
            Container(
                width: double.infinity,
                height: 80,
                //color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: first_width,),
                  Container(
                    height: 60,
                    width: 60,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                      color: IconsColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(icon:Icon(Icons.monetization_on),color: Colors.white,
                    onPressed: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>Contribution()));
                      },),
                  ),
                    SizedBox(width: equispacingparam,),
                    Container(
                      height: 60,
                      width: 60,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: IconsColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon:Icon(Icons.nature_people),
                        onPressed:() {
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>NGO_Details()));},
                        color: Colors.white,),
                    ),
                    SizedBox(width: equispacingparam,),
                    Container(
                      height: 60,
                      width: 60,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: IconsColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(icon:Icon(Icons.announcement),color: Colors.white,),
                    ),
                    //SizedBox(width: 50,),
                ],)),
            SizedBox(height: alternate_gap,),
            Container(
                width: double.infinity,
                height: 80,
                //color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: first_width,),
                    Container(
                      height: 60,
                      width: 60,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: IconsColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(icon:Icon(Icons.art_track),color: Colors.white,),
                    ),
                    SizedBox(width: equispacingparam,),
                    Container(
                      height: 60,
                      width: 60,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: IconsColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(icon:Icon(Icons.account_box),color: Colors.white,),
                    ),
                    SizedBox(width: equispacingparam,),
                    Container(
                      height: 60,
                      width: 60,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                        color: IconsColor,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(icon:Icon(Icons.share),color: Colors.white,),
                    ),
                    //SizedBox(width: 50,),
                  ],)),
            SizedBox(height: alternate_gap,),
            Column(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellowAccent,
                  ),
                  child: IconButton(icon:Icon(Icons.announcement),
                  onPressed: ()
                    {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>HelpScreen()),);
                    },),
                ),
                Text('Help',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

