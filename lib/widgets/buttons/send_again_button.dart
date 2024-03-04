import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SendAgainButton extends StatelessWidget {
  const SendAgainButton({super.key, required this.onPressed,  this.label = "", this.width = 327});
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
            borderRadius: BorderRadius.circular(40),
          side: BorderSide(width: 1, color: HexColor("#D0DBEA"))
        ),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(
            fontSize: 17,
            color: HexColor("#D0DBEA"),
            fontWeight: FontWeight.bold
        ),));
  }
}
