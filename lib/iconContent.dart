import 'package:flutter/material.dart';
import 'constants.dart';

//This class represents our iconContent that our Reusable card will have

//To know what classes to refractor or create we have to look at the repeated values or widgets tha will be reused aswell as the same widgets taht will be labelled differently i.e female male these would be variables

class iconContent extends StatelessWidget {

  final IconData icon;
  final String label;

  iconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kLabelIconSize,
        ),
        SizedBox(
          height:kLabelIconHeight,
        ),
        Text(
          label,
        style:kLabelTextStyle ,
        )
      ],
    );
  }
}