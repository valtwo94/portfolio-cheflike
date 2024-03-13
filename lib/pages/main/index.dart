
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cheflike/pages/main/home.dart';
import 'package:cheflike/pages/main/notification.dart';
import 'package:cheflike/pages/main/profile.dart';
import 'package:cheflike/pages/main/search.dart';
import 'package:cheflike/pages/upload.dart';
import 'package:cheflike/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<MainProvider>(context);

    return Scaffold(
      body: PageView(
        controller: mp.mainPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
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
        onTap: (v){
          switch(v){
            case 0:
              mp.mainPageController.jumpToPage(0);
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPage()));
              break;
            case 2:
              mp.mainPageController.jumpToPage(2);
              break;
            case 3:
              mp.mainPageController.jumpToPage(3);
              break;
          }
        },
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
