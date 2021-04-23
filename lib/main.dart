import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child_content.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int _heightValue = 185;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  gestureTap: () {
                    setState(() {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveBoxColor
                      : kInactiveBoxColor,
                  cardChild: CardChildContent(
                    iconType: FontAwesomeIcons.mars,
                    gender: 'MUŠKO',
                  ),
                ),
                ReusableCard(
                  gestureTap: () {
                    setState(() {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveBoxColor
                      : kInactiveBoxColor,
                  cardChild: CardChildContent(
                    iconType: FontAwesomeIcons.venus,
                    gender: 'ŽENSKO',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  colour: kActiveBoxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'VISINA',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            _heightValue.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: _heightValue.toDouble(),
                        max: maxHeight.toDouble(),
                        min: minHeight.toDouble(),
                        activeColor: kBottomContainerColor,
                        onChanged: (double value) {
                          setState(() {
                            _heightValue = value.round();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: kActiveBoxColor),
                ReusableCard(colour: kActiveBoxColor),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 5),
            height: kBottomContainerHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'IZRAČUNAJ',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
