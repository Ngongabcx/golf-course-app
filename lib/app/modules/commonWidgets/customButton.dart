import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, required this.textStyle, required this.onPressed});

  final String text;
  final TextStyle? textStyle;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GcmsTheme.darkTextTheme.headline3,
      ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(textStyle),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
          kPrimaryColor,
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
