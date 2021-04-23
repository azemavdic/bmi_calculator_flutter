import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child_content.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int _heightValue = 185;
  int _weightValue = 85;

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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'TEŽINA',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        _weightValue.toString(),
                        style: kNumberTextStyle,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AddRemoveBtn(
                              icon: Icons.remove,
                              onPress: removeWeight,
                            ),
                            AddRemoveBtn(
                              icon: Icons.add,
                              onPress: addWeight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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

class AddRemoveBtn extends StatelessWidget {
  AddRemoveBtn({this.onPress, this.icon});
  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: Colors.grey.shade600,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
