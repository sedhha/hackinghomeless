import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacking_homeless/temp_values.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hacking_homeless/valuesetter.dart';
import 'package:hacking_homeless/allvalues.dart';
import 'dart:async';

class AdminDataUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Admin_DataUpload();
  }
}
class Admin_DataUpload extends StatefulWidget {
  @override
  _Admin_DataUploadState createState() => _Admin_DataUploadState();
}

class _Admin_DataUploadState extends State<Admin_DataUpload>
    with TickerProviderStateMixin{
  Widget PictureWidget=Text('Image will appear here!');
  File _image;
  bool setdisplay=false;
  String Media_Post_text="";
  String General_Post_text="";
  Widget MyWidget=Text('Upload appears here');
  int MediaUpload=0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore=Firestore.instance;
  AnimationController controller;
  Animation<double> animation;
  @override
  initState()
  {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image.runtimeType);
    if(image!=null)
    {
      TriggerUpdate();
      setState(() {
      print("Image to set ho gya");
      _image = image;
      setState(() {
        print("picture widget set");
        PictureWidget=Image.file(_image,height: 300,width: double.infinity,);
      });
    });}
  }
  void TriggerUpdate()
  {
    setState(() {
      MyWidget=Column(
        children: <Widget>[
          Container(
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
                hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
                color: Colors.black38,
              ),),
              cursorColor: Colors.black,
              onChanged: (text) {Media_Post_text = text;},

            ),
          ),
          SizedBox(height: 10,),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //SizedBox(width: 150,),
              Container(
                color: Colors.grey,
                height: 50,width:200,
                child: IconButton(icon:Icon(Icons.image),
                  onPressed: ()
                  {

                    setdisplay=true;
                    print("setdisplay=$setdisplay");
                    getImage();

                  },),
              ),
            ],
          ),),
          Container(width: double.infinity, height:10,color: Colors.yellowAccent,),
          PictureWidget,
          //Image.file(_image,height: 300,width: double.infinity,),
        ],
      );
      CheckFunctionAndAssign();
    });
  }
  void CheckFunctionAndAssign()
  {
    print("MediaUpload=$MediaUpload");
    if(MediaUpload==2)
      {
        setState(() {
          MyWidget=Container(
            height: 350,
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
    else if(MediaUpload==1)
      {
        setState(() {
          MyWidget=Column(
            children: <Widget>[
              Container(
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
                    hintText: "Describe it here!",hintStyle: LoginTextStyle.copyWith(
                    color: Colors.black38,
                  ),),
                  cursorColor: Colors.black,
                  onChanged: (text) {Media_Post_text = text;},

                ),
              ),
              SizedBox(height: 10,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              //SizedBox(width: 150,),
              Container(
              color: Colors.grey,
              height: 50,width:200,
              child: IconButton(icon:Icon(Icons.image),
              onPressed: ()
                {

                    setdisplay=true;
                    print("setdisplay=$setdisplay");
                    getImage();

                },),
              ),
              ],
              ),),
              Container(width: double.infinity, height:10,color: Colors.yellowAccent,),
              PictureWidget,
              //Image.file(_image,height: 300,width: double.infinity,),
            ],
          );
        });
      }
    else
      {
        setState(() {
          MyWidget=Center(
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
                  onChanged: (text) {Media_Post_text = text;},

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
                  onChanged: (text) {Media_Post_text = text;},

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
                  onChanged: (text) {Media_Post_text = text;},

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
                  onChanged: (text) {Media_Post_text = text;},

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
                  onChanged: (text) {Media_Post_text = text;},

                ),
              ],
            ),
          );
        });
      }
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgC,
        appBar: AppBar(
          title: Text('Data Upload'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width:10,),
                RaisedButton(
                  onPressed: ()
                  {
                    MediaUpload=1;
                    CheckFunctionAndAssign();
                  },
                  child: Row(children: <Widget>[Text('Media Post'),
                  Icon(Icons.cloud_upload),],),
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  onPressed: (){
                    MediaUpload=2;
                    CheckFunctionAndAssign();
                  },
                  child: Row(children: <Widget>[Text('Generic Post'),
                    Icon(Icons.mobile_screen_share),],),
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  onPressed: ()
                  {
                    MediaUpload=3;
                    CheckFunctionAndAssign();
                  },
                  child: Row(children: <Widget>[Text('Event'),
                    Icon(Icons.nature_people),],),
                ),
              ],
            ),
            SizedBox(height: 30,),
            MyWidget,
            SizedBox(height: 10,),
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
                  onPressed: ()
                  {},
                ),
              ),),

          ],

        ),
      ),
    );
  }
}
