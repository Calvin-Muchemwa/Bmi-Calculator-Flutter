import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  @override
  final String bmiResult;
  final String ResultText;
  final String ResultInterpretation;

  ResultsPage(
      {@required this.bmiResult,
      @required this.ResultInterpretation,
      @required this.ResultText});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$ResultText'.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    '$bmiResult',
                    style: kBmiTextStyle,
                  ),
                  Text(
                    '$ResultInterpretation',
                    style: kBodyTextStyle,textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'Re-Calculate',
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
