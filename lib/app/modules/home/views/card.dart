import 'package:flutter/material.dart';

class OptionsCard extends StatelessWidget {
  final String text1;
  final IconData icon;
  final Function() onTapped;
  final Color color;

  const OptionsCard(
      {Key? key,
      required this.text1,
      required this.icon,
      required this.onTapped,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: Stack(
          children: [
            Text(
              text1,
              style: Theme.of(context).textTheme.bodyText1,
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
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
