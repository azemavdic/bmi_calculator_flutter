import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.gestureTap});
  final Color colour;
  final Widget cardChild;
  final Function gestureTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: gestureTap,
        child: Container(
          child: cardChild,
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
          margin: EdgeInsets.all(5.0),
        ),
      ),
    );
  }
}
