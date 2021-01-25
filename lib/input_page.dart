import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'iconContent.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';
//constance

enum Gender {
  //Wow Power of enums ..bascially useful when we have types of a specific thing i.e gender
  //cannot initialize these in Classes
  male,
  female,
}

enum botton {
  //Wow Power of enums ..bascially useful when we have types of a specific thing i.e gender
  //cannot initialize these in Classes
  plus,
  minus,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

//variables
  Gender selectedGender;
  botton selectedBotton;
  int height = 180;
  int weight = 40;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor, //Terinary if statment remember this method
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                    child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 10,
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Color(0xffeb1555),
                      inactiveColor: Color(0xfff8d8e98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReuseableCard(
                  colour: Color(kReusableCardColor),
                  cardChild: Column(
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        '$weight',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: (){
                            setState(() {
                              weight-=1;
                            });
                          },),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                              weight+=1;
                            });
                          },),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReuseableCard(
                  colour: Color(kReusableCardColor),
                  cardChild: Column(
                    children: <Widget>[

                      Text('Age', style: kLabelTextStyle),

                      Text(
                        '$age',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [

                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed:(){
                          setState(() {
                            age-=1;
                          });
                        }),SizedBox(width: 10.0,), RoundIconButton(icon: FontAwesomeIcons.plus, onPressed:(){
                          setState(() {
                            age+=1;
                          });
                        })

                      ],)
                    ],
                  ),
                ))
              ],
            ),
          ),

          BottomButton(text:'Calculate',onTap: (){
            CalculatorBrain calc=CalculatorBrain(weight: weight,height: height);
          Navigator.push(context,MaterialPageRoute(
            builder: (context)=>ResultsPage(bmiResult: calc.calculateBmi(), ResultInterpretation: calc.getInterpretation(), ResultText: calc.getResult())
          ));
          },)

        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {//This is our custom floating button that we've designed Ourselves  final IconData icon;
  final Function onPressed;
  final IconData icon;
  RoundIconButton({@required this.icon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
