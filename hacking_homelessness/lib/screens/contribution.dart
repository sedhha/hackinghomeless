import 'package:flutter/material.dart';
import 'package:hacking_homeless/screens/loginscreen.dart';
import 'package:hacking_homeless/screens/user_screen.dart';
import 'package:hacking_homeless/temp_values.dart';
import 'package:hacking_homeless/valuesetter.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution>
    with TickerProviderStateMixin{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  String Awareness_Name="";
  String Awareness_date="";
  String Awareness_location="";
  String Awareness_Description="";
  final _collection=Firestore.instance;
  String _NameOfCurrentUser;
  String Idea="";
  Widget ContainerWidget=TextFormField(
    obscureText: true,
    style: LoginTextStyle,
    decoration: InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(
          left: 20, bottom: 20, top: 20, right: 20),
      hintText: "Enter all the details.",hintStyle: LoginTextStyle.copyWith(
      color: Colors.black38,
    ),),
    cursorColor: Colors.black,
    onChanged: null,

  );
  String dropdownValue="DropDownValue";
  int select_Contrib=0;
  AnimationController controller;
  Animation<double> animation;
  List<ContributionMethods> _contributions=ContributionMethods.getContributionModels();
  List<DropdownMenuItem<ContributionMethods>> _dropdownitems;
  ContributionMethods _contribs;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    _dropdownitems=buildDropDownMenuItems(_contributions);
    _contribs=_dropdownitems[0].value;
  }
  List<DropdownMenuItem<ContributionMethods>> buildDropDownMenuItems(List contributions)
  {
    List<DropdownMenuItem<ContributionMethods>> items=List();
    for(ContributionMethods c in contributions)
      {
        items.add(DropdownMenuItem(value: c,child: Text(c.idea),));
      }
    return items;
  }
  void GetUserDetailsByEmail(String emailid)
  async{
      final FirebaseUser user = await _auth.currentUser().catchError((onError)
      {
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>LoginScreen()),);
      });
      print("Here reached");
      final datavv= await _collection.collection('UserDetails').where("Email",isEqualTo: user.email).getDocuments().then((QuerySnapshot snapshot){
        snapshot.documents.forEach((DocumentSnapshot documentSnapshot){
          setState(() {
            _NameOfCurrentUser=documentSnapshot.data['Name'];
            print(_NameOfCurrentUser);
          });
        });
      });



  }
  void Update_Widget(int id)
  {
   setState(() {
     if(id==2)
       {
         setState(() {
           ContainerWidget=Container(width: 250,height:80,
             child: DecoratedBox(
               decoration:
               ShapeDecoration(shape:roundedrectangle, color:LoginMainButtonColor),
               child: OutlineButton(
                 color:LoginMainButtonColor,
                 borderSide: BorderSide(color:Colors.white,),
                 shape: roundedrectangle,

                 child: Center(child: Text('Make Donation',
                   style: TextStyle(color: Colors.white,fontSize: 30.0),)),
                 onPressed: ()
                 {
                   print("Pressed");
                 },
               ),
             ),);
         });
       }
     else if(id==3)
       {
         setState(() {
           ContainerWidget=Container(
             height: 330,width: 350,
             child: Column(
               children: <Widget>[
                 Container(
                   height: 40,
                   color: Colors.white,
                   child: TextFormField(
                     //keyboardType: TextInputType.multiline,
                     //maxLines: null,
                     obscureText: false,
                     style: LoginTextStyle,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.only(
                           left: 20, bottom: 20, top: 20, right: 20),
                       hintText: "Campaign/Activity Name",hintStyle: LoginTextStyle.copyWith(
                       color: Colors.black38,
                     ),),
                     cursorColor: Colors.black,
                     onChanged: (text) {Awareness_Name = text;},

                   ),
                 ),
                 SizedBox(height: 10,),
                 Container(height: 40,
                   color: Colors.white,
                   child: TextFormField(
                     //keyboardType: TextInputType.multiline,
                     //maxLines: null,
                     obscureText: false,
                     style: LoginTextStyle,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.only(
                           left: 20, bottom: 20, top: 20, right: 20),
                       hintText: "Date (MM-DD-YYYY)",hintStyle: LoginTextStyle.copyWith(
                       color: Colors.black38,
                     ),),
                     cursorColor: Colors.black,
                     onChanged: (text) {Awareness_date = text;},

                   ),
                 ),
                 SizedBox(height: 10,),
                 Container(height: 40,
                   color: Colors.white,
                   child: TextFormField(
                     //keyboardType: TextInputType.multiline,
                     //maxLines: null,
                     obscureText: false,
                     style: LoginTextStyle,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.only(
                           left: 20, bottom: 20, top: 20, right: 20),
                       hintText: "Place",hintStyle: LoginTextStyle.copyWith(
                       color: Colors.black38,
                     ),),
                     cursorColor: Colors.black,
                     onChanged: (text) {Awareness_location = text;},

                   ),
                 ),
                 SizedBox(height: 10,),
                 Container(
                   height: 150,
                   color: Colors.white,
                   child: TextFormField(
                     keyboardType: TextInputType.multiline,
                     maxLines: null,
                     obscureText: false,
                     style: LoginTextStyle,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.only(
                           left: 20, bottom: 20, top: 20, right: 20),
                       hintText: "Short Description",hintStyle: LoginTextStyle.copyWith(
                       color: Colors.black38,
                     ),),
                     cursorColor: Colors.black,
                     onChanged: (text) {Awareness_Description = text;},

                   ),
                 ),
               ],
             ),
           );
         });
       }
     else
     {
       setState(() {
         ContainerWidget=Container(
           height: 330,width: 350,color: Colors.white,
           child: TextFormField(
             keyboardType: TextInputType.multiline,
             maxLines: null,
             obscureText: false,
             style: LoginTextStyle,
             decoration: InputDecoration(
               border: InputBorder.none,
               contentPadding: EdgeInsets.only(
                   left: 20, bottom: 20, top: 20, right: 20),
               hintText: "Enter all the details.",hintStyle: LoginTextStyle.copyWith(
               color: Colors.black38,
             ),),
             cursorColor: Colors.black,
             onChanged: (text) {Idea = text;},

           ),
         );
       });
     }


   });
  }
  onChangedDropDownMenuItem(ContributionMethods allmethods)
  {
    setState(() {
      _contribs=allmethods;
      select_Contrib=_contribs.id_name;
      Update_Widget(select_Contrib);


    });
  }
  @override
  void dispose()
  {
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
          leading: Icon(Icons.person),
          title: Text('Make A Contribution'),
          backgroundColor: dark,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              Text("Select Contribution type",
              style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
              SizedBox(height: 20,),
              Text("I want to contribute via: ",
                style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
              SizedBox(height: 20,),
              DropdownButton(
                value: _contribs,
                items: _dropdownitems,
                onChanged: onChangedDropDownMenuItem,
              ),
              SizedBox(height: 20,),
              ContainerWidget,
              SizedBox(height:10),
              Row(
                children: <Widget>[
                  SizedBox(width: 200,),
                  Container(width: 180,height:40,
                    child: DecoratedBox(
                      decoration:
                      ShapeDecoration(shape:roundedrectangle, color:Colors.blueGrey),
                      child: OutlineButton(
                        color:LoginMainButtonColor,
                        borderSide: BorderSide(color:Colors.white,),
                        shape: roundedrectangle,

                        child: Center(child: Text('Submit',
                          style: TextStyle(color: Colors.black,
                              fontSize: 24.0),)),
                        onPressed: ()
                        async{
                          final FirebaseUser user = await _auth.currentUser(
                          ).catchError((onError)
                          {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (
                                  context)=>LoginScreen()),);
                          });
                          if(select_Contrib==1)
                            {
                              await GetUserDetailsByEmail(user.email);
                              print("Data recieved: $_NameOfCurrentUser and ${user.email}");
                              _collection.collection('Idea').add({
                                'UserName':_NameOfCurrentUser,
                                'IdeaScore':"0",'UserEmail':user.email,
                                "UserIdea":Idea,'Role':RoleOfAdministrator,
                              });
                            }
                          else if(select_Contrib==3)
                          {
                            await GetUserDetailsByEmail(user.email);
                            print("Data recieved: $_NameOfCurrentUser and ${user.email}");
                            _collection.collection('AwarenessProgram').add({
                              'UserName':_NameOfCurrentUser,
                              'Date':Awareness_date,'Place':Awareness_location,
                              'Short Description':Awareness_Description,
                              'UserEmail':user.email,"CampaignName":Awareness_Name,
                              'Role':RoleOfAdministrator,
                            });
                          }
                        },
                      ),
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

