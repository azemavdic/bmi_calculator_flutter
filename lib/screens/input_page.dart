import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/card_child_content.dart';
import '../constants.dart';
import '../components/add_remove_child.dart';
import 'result_page.dart';
import '../components/bottom_btn.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int _heightValue = 185;
  int _weightValue = 85;
  int _ageValue = 30;

  void addWeight() {
    setState(() {
      _weightValue++;
    });
  }

  void removeWeight() {
    setState(() {
      _weightValue--;
    });
  }

  void addAge() {
    setState(() {
      _ageValue++;
    });
  }

  void removeAge() {
    setState(() {
      _ageValue--;
    });
  }

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
                  flex: 1,
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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kBottomContainerColor,
                          thumbColor: kBottomContainerColor,
                          overlayColor: kOverlayColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                        ),
                        child: Slider(
                          value: _heightValue.toDouble(),
                          max: maxHeight.toDouble(),
                          min: minHeight.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _heightValue = value.round();
                            });
                          },
                        ),
                      ),
                    ],
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
                  cardChild: AddRemoveChild(
                    add: addWeight,
                    remove: removeWeight,
                    text: 'TEŽINA',
                    value: _weightValue,
                  ),
                ),
                ReusableCard(
                  colour: kActiveBoxColor,
                  cardChild: AddRemoveChild(
                    add: addAge,
                    remove: removeAge,
                    text: 'GODINE',
                    value: _ageValue,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'IZRAČUNAJ',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: _heightValue, weight: _weightValue);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ResultsPage(
                    bmiResult: calc.calculateBmi(),
                    textResult: calc.getResult(),
                    bodyResult: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
