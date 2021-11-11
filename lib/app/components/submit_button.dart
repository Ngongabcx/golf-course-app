import 'package:flutter/material.dart';
import 'package:gcms/theme/gcms_theme.dart';

class SubmitButton extends StatelessWidget {

  final String text;
  final TextStyle style;
  final Function() onPressed;

  const SubmitButton({Key key, this.text, this.style, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GcmsTheme.darkTextTheme.headline3,
      ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(style),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF22C17B),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(400.0, 50.0),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}
