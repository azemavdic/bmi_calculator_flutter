import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_btn.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String textResult;
  final String bodyResult;
  ResultsPage({this.bmiResult, this.textResult, this.bodyResult});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'REZULTAT',
                  style: kTitleStyle,
                ),
              ),
            ),
          ),
          ReusableCard(
            flex: 5,
            colour: kActiveBoxColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textResult,
                  style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBmiTextStyle,
                ),
                Text(
                  bodyResult,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
          BottomButton(
              text: 'PRERAČUNAJ',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
