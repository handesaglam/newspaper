import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newspaper/views/favorite.dart';
import 'package:newspaper/views/home.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int currentTab = 0;
  final List<Widget> screens = [
   Home(),
   Favorite(),
  
  ];
  Widget currentScreen = Home();
final PageStorageBucket bucket = PageStorageBucket();
 @override
  Widget build(BuildContext ctx) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar: bmnav.BottomNav(
      index: currentTab,
        labelStyle: bmnav.LabelStyle(visible: true),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },
        items: [
          bmnav.BottomNavItem(FontAwesomeIcons.globe, label: 'News'),
          bmnav.BottomNavItem(Icons.favorite, label: 'Favorite'),
         
        ],
      ),
    );
  }
}

