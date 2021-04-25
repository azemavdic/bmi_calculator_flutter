import 'package:flutter/material.dart';

class AddRemoveBtn extends StatelessWidget {
  AddRemoveBtn({@required this.onPress, @required this.icon});
  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      fillColor: Colors.grey.shade600,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
