import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeBoxColor = Color.fromRGBO(100, 100, 100, 0.6);
const inactiveBoxColor = Color.fromRGBO(100, 100, 100, 0.2);

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

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveBoxColor;
  Color femaleCardColor = inactiveBoxColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveBoxColor) {
        maleCardColor = activeBoxColor;
        femaleCardColor = inactiveBoxColor;
      } else {
        maleCardColor = inactiveBoxColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == inactiveBoxColor) {
        femaleCardColor = activeBoxColor;
        maleCardColor = inactiveBoxColor;
      } else {
        femaleCardColor = inactiveBoxColor;
      }
    }
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(1);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColor,
                    cardChild: CardChildContent(
                      iconType: FontAwesomeIcons.mars,
                      gender: 'MUŠKO',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      setState(() {
                        updateColor(2);
                      });
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColor,
                    cardChild: CardChildContent(
                      iconType: FontAwesomeIcons.venus,
                      gender: 'ŽENSKO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: activeBoxColor),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: activeBoxColor),
                ReusableCard(colour: activeBoxColor),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 5),
            height: bottomContainerHeight,
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
