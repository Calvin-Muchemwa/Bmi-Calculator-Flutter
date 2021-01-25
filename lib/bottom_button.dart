import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final String text;
  final String routetext;
  final Function onTap;

  BottomButton({this.text,this.routetext,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap
      ,
      child: Container(

        child: Center(child: Text('$text',style: kLargeBUttonStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double
            .infinity, //this tells the contaioner to fit to screen in width
        height: kBottomContainerHeight,
      ),
    );
  }
}