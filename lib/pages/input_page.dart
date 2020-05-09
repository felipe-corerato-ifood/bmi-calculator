import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';

import '../constants/constants.dart';
import '../core/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 183;
  int weight = 74;
  int age = 20;

  void selectGender(Gender gender) {
    setState(() {
      switch (gender) {
        case Gender.MALE:
          selectedGender = Gender.MALE;
          break;
        case Gender.FEMALE: 
          selectedGender = Gender.FEMALE;
          break;
      }   
    });
  }

  void setWeight(int newValue) {
    if (newValue < 20) return;

    setState(() {
      weight = newValue;
    });
  }

  void setAge(int newValue) {
    if (newValue < 1) return;

    setState(() {
      age = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () => selectGender(Gender.MALE),
                    color: selectedGender == Gender.MALE ? 
                      kCardStyles['activeColor'] : 
                      kCardStyles['inactiveColor'],
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => selectGender(Gender.FEMALE),
                    color: selectedGender == Gender.FEMALE ? 
                      kCardStyles['activeColor'] : 
                      kCardStyles['inactiveColor'],
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kCardStyles['activeColor'],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text.rich(
                    TextSpan(
                      text: height.toString(),
                      style: kNumberTextStyle,
                      children: [TextSpan(
                        text: 'cm',
                        style: kLabelTextStyle
                      )]
                    )
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kSliderStyle['activeColor'],
                      inactiveTrackColor: kSliderStyle['inactiveColor'],
                      thumbColor: kSliderStyle['thumbColor'],
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: kSliderStyle['overlayColor'],
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kCardStyles['activeColor'],
                    child: ReusableContainer(
                      label: 'WEIGHT',
                      content: weight.toString(),
                      onLeftButtonPress: () => setWeight(weight-1),
                      onRightButtonPress: () => setWeight(weight+1),
                    )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kCardStyles['activeColor'],
                    child: ReusableContainer(
                      label: 'AGE',
                      content: age.toString(),
                      onLeftButtonPress: () => setAge(age-1),
                      onRightButtonPress: () => setAge(age+1),
                    )
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              CalculatorBrain cb = CalculatorBrain(selectedGender, height, weight, age);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ResultPage(
                    bmiResult: cb.calculateBMI(), 
                    resultText: cb.getResult(),
                    bmiInterpretation: cb.getInterpretation(), 
                  )
                )
              );
            },
            color: kLargeButtonStyle['color'],
            child: Text(
              'CALCULATE', 
              style: kLargeButtonStyle['text']
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final String label;
  final String content;
  final Function onLeftButtonPress;
  final Function onRightButtonPress;

  const ReusableContainer({Key key, this.label, this.content, this.onLeftButtonPress, this.onRightButtonPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          content, 
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPress: onLeftButtonPress
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPress: onRightButtonPress
            ),
          ],
        ),
      ],
    );
  }
}