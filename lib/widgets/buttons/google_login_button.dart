import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key, required this.onPressed,  this.label = "", this.width = 327});
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
        color: HexColor("#FF5842"),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Icon(FontAwesomeIcons.google, color: Colors.white, size: 16,),
            ),
            const SizedBox(width: 8,),
            Text(label, style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ],
        ));
  }
}
