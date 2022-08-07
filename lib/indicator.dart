import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final bool isSquare;
  final double size;

   const Indicator({
    required this.color,
    this.textColor = Colors.white,
    required this.text,
    required this.isSquare,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}