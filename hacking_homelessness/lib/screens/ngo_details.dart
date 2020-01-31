import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hacking_homeless/screens/admin_upload.dart';
import 'package:hacking_homeless/screens/aol.dart';
import 'package:hacking_homeless/screens/loginscreen.dart';
import 'package:hacking_homeless/screens/user_screen.dart';
import 'package:hacking_homeless/spinkit_value.dart';
import 'package:hacking_homeless/temp_values.dart';
import 'package:hacking_homeless/valuesetter.dart';

class NGODetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NGO_Details();
  }
}
class NGO_Details extends StatefulWidget {
  @override
  _NGO_DetailsState createState() => _NGO_DetailsState();
}

class _NGO_DetailsState extends State<NGO_Details> {
  List<Widget> widgetTreeList=[NGO_TEMPLATE,
    NGO_TEMPLATE,
    NGO_TEMPLATE,
    NGO_TEMPLATE,
    NGO_TEMPLATE,
    NGO_TEMPLATE,
    NGO_TEMPLATE];
  Widget appBar=Container();
  int errorcode=0;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final _collection=Firestore.instance;
  @override
  void GetNGOSnapshots()
  async
  {
    //print("Kuch to hua hai");
    await for(var snapshots in _collection.collection('NGO_Events').snapshots())
    {
      for(var message in snapshots.documents)
      {
        print(message.data['EName']);
      }
    }
  }
  void initState() {

    //print("But neither have you.");
    if(RoleOfAdministrator==true)
        {
          //print(RoleOfAdministrator);
          setState(() {
            appBar=IconButton(
              onPressed: (){
                GetNGOSnapshots();
                print(DateTime.now());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>MediaUploadingClass()));
              },
              icon: Icon(Icons.add),
            );
          });}
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgC,
        title: Text("Recent NGOs",),
        actions: <Widget>[
          appBar,
        ],
      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: _collection.collection('NGO_Events').snapshots(),
            builder: (context,snapshot)
            {
              //List<Text> AllContainerData=[];
              List<Container> ContainerAttempt=[];
              if(!snapshot.hasData)
                {return(Container());}
              if(snapshot.hasData)
                {
                  final messages=snapshot.data.documents;
                  for(var message in messages)
                    {
                      final contact=message.data['Contact'];
                      final date=message.data['Date'];
                      final ename=message.data['EName'];
                      final location=message.data['Location'];
                      final tags=message.data['Tags'];
                      try
                      {//final container_value=Text('$contact,$date');
                      final cont=Container(
                        color: Colors.yellowAccent,
                        height: 250,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10,),
                                Text('Event: $ename',
                                  style: TextStyle(fontWeight: FontWeight.bold,),),
                                SizedBox(height: 10,),
                                Text('Date: $date'),
                                SizedBox(height: 10,),
                                Text('Location: $location'),
                                SizedBox(height: 10,),
                                Text('Tags: $tags'),
                                SizedBox(height: 10,),
                                Text('Contact: $contact'),

                              ],
                            ),
                            SizedBox(width: 10,),
                            Container(
                                child: Image.asset(
                                    'assets/images/ngoPage/ngo.png'),
                            height:200,
                            width:150,),
                          ],
                        ),
                      );
                      setState(() {
                        //AllContainerData.add(container_value);
                        ContainerAttempt.add(cont);
                        ContainerAttempt.add(Container(child:SizedBox(height: 10,)));
                      });
                      }
                      catch(e)
                      {//print(e);
                         }
                    }
                  //print(AllContainerData.length);
                  return(ContainerAttempt.length==0?
                  Container():Column(children:ContainerAttempt));
                }
              return(Container());

            },
          ),
        ],
      ),
    );
  }
}

