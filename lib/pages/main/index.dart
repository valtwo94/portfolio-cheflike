import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cheflike/pages/main/home.dart';
import 'package:cheflike/pages/main/notification.dart';
import 'package:cheflike/pages/main/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("쉐프라이크", style: Theme.of(context).primaryTextTheme.titleMedium,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: HexColor("#2E3E5C"),))
        ],
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          NotificationPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(FontAwesomeIcons.expand),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: 0,
        onTap: (v){},
        icons: const [
          FontAwesomeIcons.house,
          FontAwesomeIcons.penToSquare,
          FontAwesomeIcons.bell,
          FontAwesomeIcons.user,
        ],
        activeColor: Theme.of(context).primaryColor,
        gapLocation: GapLocation.center,
      )
    );
  }
}
