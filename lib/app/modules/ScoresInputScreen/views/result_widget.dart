import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';

class ResultWidget extends StatelessWidget {

  final String text;
  final TextStyle? textStyle;

  const ResultWidget({Key? key, required this.text, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(text),
      textStyle: (textStyle),
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
