import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {

  final String text;
  final TextStyle style;

  const ResultWidget({Key key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(text),
      textStyle: (style),
      elevation: 4.0,
      fillColor: Color(0xFF22C17B),
      constraints: const BoxConstraints.tightFor(
        width: 55.0,
        height: 60.0,
      ),
      shape: const CircleBorder(),
      onPressed: () {},
    );
  }
}
