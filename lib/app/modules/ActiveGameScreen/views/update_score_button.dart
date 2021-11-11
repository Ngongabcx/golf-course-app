import 'package:flutter/material.dart';

class UpdateScoreButtton extends StatelessWidget {

  final IconData icon;
  final Function() onPressed;

  const UpdateScoreButtton({Key key, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      splashColor: const Color(0xFF22C17B).withOpacity(0.5),
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: const CircleBorder(
        side: BorderSide(
          color: Color(0xFFD8D8D8),
        ),
      ),
    );
  }
}
