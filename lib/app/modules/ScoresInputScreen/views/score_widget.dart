import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {

  final String text;
  final TextStyle style;

  const ScoreWidget({Key key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(text),
      textStyle: (style),
      fillColor: Color(0xFFF5F7F9),
      elevation: 0.0,
      highlightElevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Color(0xFFD8D8D8),
        ),
      ),
      onPressed: () {},
    );
  }
}
