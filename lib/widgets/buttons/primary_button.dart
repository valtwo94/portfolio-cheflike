import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed,  this.label = "", this.width = 327});
  final VoidCallback onPressed;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      elevation: 0,
      minWidth: width,
        height: 56,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),));
  }
}
