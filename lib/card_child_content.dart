import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class CardChildContent extends StatelessWidget {
  CardChildContent({
    @required this.gender,
    @required this.iconType,
  });

  final String gender;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Ikona muška ili ženska
        FaIcon(
          iconType,
          size: 80,
        ),
        //Razmak između ikone i teksta
        SizedBox(
          height: 10,
        ),
        //Tekst 'muško'/'žensko'
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
