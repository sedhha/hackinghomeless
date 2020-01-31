import 'package:flutter/material.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/screens/loginscreen.dart';
import 'package:hacking_homeless/valuesetter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MediaUploadingClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaClass();
  }
}
class MediaClass extends StatefulWidget {
  @override
  _MediaClassState createState() => _MediaClassState();
}

class _MediaClassState extends State<MediaClass>
    with TickerProviderStateMixin{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final _collection=Firestore.instance;
  String uid="";
  String MediaPostText="";
  int Posttypeidentifier=0;
  String General_Post_text;
  String EventTitle;String EventDate;String EventLocation;  String Contact;
  String Event_Tags;
  File _image;
  String _NameOfCurrentUser;
  String _EmailOfCurrentUser;
  int _PreviousImageReference;
  Widget SetWidget=Text('Selection Appears Here');
  //List<Widget> TextBoxFields=[];

  @override
  void initState() {

    super.initState();
  }
  Future getImagefromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    Posttypeidentifier=1;
    setState(() {
      _image = image;
      SetWidget=Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 100,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {MediaPostText = text;},

            ),
          ),
          Container(
            height: 350,width: double.infinity,
            child: Image.file(_image,fit: BoxFit.cover,),
          ),//Image Container
        ],
      );
    });
  }
  Future getImagefromGallery() async {
    Posttypeidentifier=1;
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      SetWidget=Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            height: 100,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {MediaPostText = text;},

            ),
          ),
          Container(
            height: 350,width: double.infinity,
            child: Image.file(_image,fit: BoxFit.cover,),
          ),//Image Container
        ],
      );
    });
  }
  void SetEvent()
  {
    Posttypeidentifier=2;
    setState(() {
      SetWidget=Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 30,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Event Title",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {EventTitle = text;},
            ),
            SizedBox(width: 30,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Event Date",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {EventDate = text;},

            ),
            SizedBox(width: 30,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Event Location",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {EventLocation = text;},

            ),
            SizedBox(width: 30,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Tags [Seperate by ',']",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {Event_Tags = text;},


            ),
            SizedBox(width: 30,),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Contact Email or Number",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {Contact = text;},

            ),
          ],
        ),
      );
    });
  }
  void SelectTextPost()
  {
    Posttypeidentifier=3;
    setState(() {
      SetWidget=Container(
        height: 400,
        width: double.infinity,
        child:TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          obscureText: false,
          style: LoginTextStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: 20, bottom: 20, top: 20, right: 20),
            hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
            color: Colors.black38,
          ),),
          cursorColor: Colors.black,
          onChanged: (text) {General_Post_text = text;},

        ),
      );
    });
  }
  void MediaPost()
  {
    Posttypeidentifier=1;
    setState(() {
      SetWidget=Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                height: 40,width: 200,
                child: IconButton(icon: Icon(Icons.camera),
                  onPressed: getImagefromCamera,),
              ),
              Container(
                color: Colors.blueGrey,
                height: 40,width: 200,
                child: IconButton(icon: Icon(Icons.file_upload),
                  onPressed: getImagefromGallery,),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              obscureText: false,
              style: LoginTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20, bottom: 20, top: 20, right: 20),
                hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {MediaPostText = text;},

            ),
          ),
          Text('Media will appear here.'),
          //Image Container
        ],
      );
    });
  }
  void GetUserDetailsByEmail()
  async{
    final FirebaseUser user = await _auth.currentUser().catchError((onError)
    {
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>LoginScreen()),);
    });
    final datavv= await _collection.collection('UserDetails').where("Email",isEqualTo: user.email).getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((DocumentSnapshot documentSnapshot){
        setState(() {
          _NameOfCurrentUser=documentSnapshot.data['Name'];
          _EmailOfCurrentUser=documentSnapshot.data['Email'];
          uid=user.uid;
        });
      });
    });



  }
  void CloudDataUpload()
  async{
    if(Posttypeidentifier==2)
    {
      await GetUserDetailsByEmail();
      print("Data recieved: $_NameOfCurrentUser and $_EmailOfCurrentUser");
      _collection.collection('NGO_Events').add({
        'Contact':Contact,
        'Tags':Event_Tags,
        'Date':EventDate,'ReportedEmail':_EmailOfCurrentUser,
        "EName":EventTitle,'Location':EventLocation,
      });
    }
    else if(Posttypeidentifier==3)
      {
        await GetUserDetailsByEmail();
        _collection.collection('TextPosts').add({
          'TimeStamp':DateTime.now(),'ReportedEmail':_EmailOfCurrentUser,
          "ReportingName":_NameOfCurrentUser,'PostText':General_Post_text,
        });
      }
    else
    {
      await GetUserDetailsByEmail();
      _collection.collection('ImageData').add({
        'AdderDateStamp':DateTime.now(),'AdderEmail':_EmailOfCurrentUser,
      });

    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Admin Pannel'),
      backgroundColor: AppBarButtonColor,),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              SizedBox(width:10,),
              RaisedButton(
                onPressed: MediaPost,
                child: Row(children: <Widget>[Text('Media Post'),
                  Icon(Icons.cloud_upload),],),
              ),
              SizedBox(width: 10,),
              RaisedButton(
                onPressed: SelectTextPost,
                child: Row(children: <Widget>[Text('Generic Post'),
                  Icon(Icons.mobile_screen_share),],),
              ),
              SizedBox(width: 10,),
              RaisedButton(
                onPressed: SetEvent,
                child: Row(children: <Widget>[Text('Event'),
                  Icon(Icons.nature_people),],),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(height: 6,color: Colors.yellowAccent,width: double.infinity,),
          SetWidget,
          Container(width: 250,height:50,
            child: DecoratedBox(
              decoration:
              ShapeDecoration(shape:roundedrectangle, color:LoginMainButtonColor),
              child: OutlineButton(
                color:LoginMainButtonColor,
                borderSide: BorderSide(color:Colors.white,),
                shape: roundedrectangle,

                child: Center(child: Text('Submit',
                  style: TextStyle(color: Colors.white,),)),
                onPressed: CloudDataUpload,
              ),
            ),),

        ],
      ),
    );
  }
}

