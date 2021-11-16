import 'package:flutter/material.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

class OptionsCard extends StatelessWidget {
  final String text1;
  final IconData icon;
  final Function() onTapped;
  final Color color;

  const OptionsCard({Key key, this.text1, this.icon, this.onTapped, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: Stack(
          children: [
            Text(
              text1,
              style: GcmsTheme.darkTextTheme.bodyText1,
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                icon,
                color: color,
                size: 50,
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
