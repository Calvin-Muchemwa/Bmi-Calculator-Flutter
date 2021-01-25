import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.weight,this.height});

  final int height;
  final int weight;
  double _bmi;

  String calculateBmi(){

    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);//
  }


  String getResult(){
    
    if(_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return'Underweight';
    }

  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than Normal Bodyweight,Try to excercise more';
    }
    else if(_bmi>18.5){
      return 'You Have a normal bodyweight ,Good job';
    }
    else{
      return'You have a lower than usual bodyweight you can eat a bit more';
    }
  }
}