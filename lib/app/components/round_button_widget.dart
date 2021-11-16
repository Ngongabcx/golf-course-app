import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';

class RoundButtonWidget extends StatelessWidget {

  final String text;
  final TextStyle style;

  const RoundButtonWidget({Key key, this.text, this.style}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(text),
      textStyle: (style),
      elevation: 4.0,
      fillColor: Color(0xFFFFFFFF),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 60.0,
      ),
      shape: const CircleBorder(
        side: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      onPressed: () {},
    );
  }
}
