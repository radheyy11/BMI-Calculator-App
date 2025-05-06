import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData ic;
  final VoidCallback onPressed;
  RoundIconButton({required this.ic, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.grey[700],
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      child: Icon(ic),
    );
  }
}