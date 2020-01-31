import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
Color bgC=Color(0xffd0d1cf);
Color dark=Color(0xffa9a9a9);
Color squarecolor=Color(0xFFcfd8dc);
String UserName="John Blick";
String City="Nevada, CF";
Color IconsColor=Color(0xff798b91);
double alternate_gap=15.0;
List<prefix0.DropdownMenuItem>Itemss=[DropdownMenuItem(child: new Text("Idea")),
  DropdownMenuItem(child: new Text("Monetary")),
  DropdownMenuItem(child: new Text("Awareness")),
];
double first_width=50.0;
List<String> DropDownValues=['Idea','Monetary','Awareness'];
String TypeofContribution='Contribute by';
class ContributionMethods
{
  String idea;
  int id_name;
  ContributionMethods(this.idea,this.id_name);
  static List<ContributionMethods> getContributionModels()
  {
    return <ContributionMethods>[
      ContributionMethods('DropDown',0),
      ContributionMethods('idea',1),
      ContributionMethods('monetary',2),
      ContributionMethods('awareness',3)
    ];

  }
}
