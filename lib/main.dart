import 'package:flutter/material.dart';

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
              children: [
                ReusableCard(colour: Colors.grey.shade800),
                ReusableCard(colour: Colors.grey.shade800),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: Colors.grey.shade800),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(colour: Colors.grey.shade800),
                ReusableCard(colour: Colors.grey.shade800),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour});
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0.1),
            ),
          ],
        ),
        height: 200,
        width: 170,
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
