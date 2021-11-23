import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({Key key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
   AnimationController controller;
   Animation<double> animationRotation;
   Animation<double> animationRadiusIn;
   Animation<double> animationRadiusOut;
  final double initialRadius = 30.0;
  double radius = 0.0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve:  const Interval(0.75, 1.0, curve: Curves.easeInOutSine),
      ),
    );
    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.slowMiddle)));
    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: animationRotation,
        child: Stack(
          children: [
            //Bigger dot
            const Dot(radius: 20.0, color: Colors.black12),
            //Smaller dots
            Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.teal)),
            //Smaller dots
            Transform.translate(
                offset: Offset(
                    radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.orangeAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.blueAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.tealAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.purpleAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.amberAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.greenAccent)),
            Transform.translate(
                offset: Offset(
                    radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: const Dot(radius: 5.0, color: Colors.redAccent)),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    Key key,
     this.radius,
     this.color,
  }) : super(key: key);
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
