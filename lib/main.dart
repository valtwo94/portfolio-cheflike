import 'package:cheflike/pages/main/index.dart';
import 'package:cheflike/pages/new_password.dart';
import 'package:cheflike/pages/onboarding.dart';
import 'package:cheflike/pages/password_recovery.dart';
import 'package:cheflike/pages/sign_in.dart';
import 'package:cheflike/pages/sign_up.dart';
import 'package:cheflike/pages/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '쉐프라이크',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: HexColor("#1FCC79"),
        primaryTextTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22,
              color: HexColor("#2E3E5C"),
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              fontSize: 17,
              color: HexColor("#2E3E5C"),
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontSize: 15,
              color: HexColor("#2E3E5C"),
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            fontSize: 17,
            color: HexColor("#2E3E5C"),
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: HexColor("#2E3E5C"),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: HexColor("#2E3E5C"),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22,
              color: HexColor("#9FA5C0"),
              fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              fontSize: 17,
              color: HexColor("#9FA5C0"),
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontSize: 15,
              color: HexColor("#9FA5C0"),
              fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
            fontSize: 17,
            color: HexColor("#9FA5C0"),
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: HexColor("#9FA5C0"),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: HexColor("#9FA5C0"),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: HexColor("#2E3E5C"),
          prefixIconColor: HexColor("#2E3E5C"),
          hintStyle: TextStyle(
            color: HexColor("9FA5C0"),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 1, color: HexColor("#D0DBEA")),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(width: 2, color: HexColor("#1FCC79"))
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(width: 2, color: HexColor("#FF6464"))
          ),
        ),
        useMaterial3: false
      ),
      home: const WidgetTree(),
    );
  }
}

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}
