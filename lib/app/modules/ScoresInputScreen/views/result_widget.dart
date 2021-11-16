import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';

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
      fillColor: kPrimaryColor,
      constraints: const BoxConstraints.tightFor(
        width: 55.0,
        height: 60.0,
      ),
      shape: const CircleBorder(),
      onPressed: () {},
    );
  }
}
