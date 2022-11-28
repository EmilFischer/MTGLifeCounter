import 'package:flutter/material.dart';
import 'dart:developer';

class StrokedText extends StatefulWidget {
  const StrokedText(this.text, {this.size = 50, super.key});
  final String text;
  final double? size;

  @override
  State<StatefulWidget> createState() {
    return _StrokedText();
  }
}

class _StrokedText extends State<StrokedText> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Colors.black,
          ),
        ),
        // Solid text as fill.
        Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.size,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}