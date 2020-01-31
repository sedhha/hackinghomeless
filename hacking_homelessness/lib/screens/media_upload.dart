import 'package:hacking_homeless/allvalues.dart';
import 'package:hacking_homeless/temp_values.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
class ImageClick extends StatefulWidget {
  @override
  _ImageClick createState() => _ImageClick();
}

class _ImageClick extends State<ImageClick> {
  File _image;

  Future getImage() async {
    var image=null;
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image.runtimeType);
    if(image!=null)
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgC,
      appBar: AppBar(
        backgroundColor: AppBarButtonColor,
        title: Text('Image Picker Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          Row(
            children: <Widget>[
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: (){},
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              SizedBox(width: 20,),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.camera),
              ),
              SizedBox(width: 20,),
              FloatingActionButton(
                heroTag: "btn3",
                onPressed: (){},
                tooltip: 'Submit',
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
