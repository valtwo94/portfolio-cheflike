import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      color: HexColor("F4F5F7"),
    );
  }
}
