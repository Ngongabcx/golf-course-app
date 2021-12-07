import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({this.text, this.style, this.onPressed, this.icon});

  final String text;
  final TextStyle style;
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: GcmsTheme.darkTextTheme.headline3,
      ),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(style),
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
      ), icon: Icon(icon,color: kPrimaryColor),
    );
  }
}
