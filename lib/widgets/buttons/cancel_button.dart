import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, required this.onPressed,  this.label = "", this.width = 327});
  final VoidCallback onPressed;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        elevation: 0,
        minWidth: width,
        height: 56,
        color: HexColor("#F4F5F7"),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(label, style: TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),));
  }
}
