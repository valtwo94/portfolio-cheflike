import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed,  this.label = ""});
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      elevation: 0,
      minWidth: 327,
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
