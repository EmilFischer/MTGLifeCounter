import 'dart:async';
import 'dart:developer';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'strokedText.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Counter();
  }
}

class _Counter extends State<Counter> {
  var life = 40;
  var sum = 0;
  var visible = false;

  late RestartableTimer timer = RestartableTimer(const Duration(seconds: 1), () {
    setState(() {
      visible = false;
    });
    Timer(const Duration(milliseconds: 500), () {
      sum = 0;
    });
  });

  String getSumText() {
    var sign = sum >= 0 ? '+' : '';
    return sign + sum.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 30),
          ),
          onPressed: () async {
            setState(() {
              sum--;
              visible = true;
              life--;
              timer.reset();
            });
          },
          child: const StrokedText('-'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            AnimatedOpacity(
              opacity: visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: StrokedText(getSumText(), size: 20),
            ),
            StrokedText(life.toString()),
          ],
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 50,),
          ),
          onPressed: () {
            setState(() {
              sum++;
              visible = true;
              life++;
              timer.reset();
            });
          },
          child: const StrokedText('+'),
        ),
      ],
    );
  }
}