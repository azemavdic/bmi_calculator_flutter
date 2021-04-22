import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        FaIcon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
