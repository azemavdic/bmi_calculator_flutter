import 'package:flutter/material.dart';
import 'add_remove_btn.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddRemoveChild extends StatelessWidget {
  AddRemoveChild({this.text, this.value, this.remove, this.add});

  final String text;
  final int value;
  final Function remove;
  final Function add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AddRemoveBtn(
                icon: FontAwesomeIcons.minus,
                onPress: remove,
              ),
              SizedBox(
                width: 10,
              ),
              AddRemoveBtn(
                icon: FontAwesomeIcons.plus,
                onPress: add,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
