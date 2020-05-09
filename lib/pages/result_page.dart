import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiInterpretation;
  final String resultText;

  const ResultPage({Key key, @required this.bmiResult, @required this.bmiInterpretation, @required this.resultText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kCardStyles['activeColor'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultCardStyles['resultText'],  
                  ),
                  Text(
                    bmiResult,
                    style: kResultCardStyles['bmiText'],  
                  ),
                  Text(
                    bmiInterpretation,
                    style: kResultCardStyles['bodyText'],
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () => Navigator.pop(context),
            color: kLargeButtonStyle['color'],
            child: Text(
              'RE-CALCULATE', 
              style: kLargeButtonStyle['text'],
            ),
          ),
        ],
      ),
    );
  }
}