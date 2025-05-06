import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData ic;
  final String txt;
  IconContent({required this.ic, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            ic,
            size: 80.0
        ),
        SizedBox(
            height: 15.0
        ),
        Text(txt,  style: TextStyle(
            fontSize: 18.0, color: Color(0xFF8D8E98))
        )
      ],
    );
  }
}