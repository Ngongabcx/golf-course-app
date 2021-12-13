import 'package:flutter/material.dart';

class SelectHolesCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function() onPress;

  const SelectHolesCard({Key? key, required this.color, required this.cardChild, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 150.0,
        height: 40,
        child: cardChild,
        margin: EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
