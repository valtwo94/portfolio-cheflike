import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  PageController mainPageController = PageController();




  @override
  void dispose() {
    mainPageController.dispose();
    super.dispose();
  }
}