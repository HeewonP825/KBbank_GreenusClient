import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../models/navItem.dart';
import 'friendlist/friendListScreen.dart';
import 'challengeList//challengeHome.dart';
import 'mypage//myPageScreen.dart';
import 'Notifications/notiScreen.dart';

//import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
//import 'package:flutter/src/scheduler/binding.dart';

class MainScreens extends StatefulWidget {
  static String routeName = "/mainScreens";

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ChallengeHome(),
          FriendWidget(),
          NotiScreen(),
          MyPageScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate(
          navItems.length,
              (index) => _buildBottomNavigationBarItem(
            icon: navItems[index].icon,
            label: navItems[index].label,
            isActive: navItems[index].id == _selectedIndex ? true : false,
          ),
        ),
      ),
      /*stylishBottomBar: StylishBottomBar(
          items: [
            AnimatedBarItems(
                icon: Icon(
                  Icons.home,
                ),
                selectedColor: Colors.deepPurple,
                backgroundColor: Colors.amber,
                title: Text('Home')),
            AnimatedBarItems(
                icon: Icon(
                  Icons.add_circle_outline,
                ),
                selectedColor: Colors.green,
                backgroundColor: Colors.amber,
                title: Text('Add')),
            AnimatedBarItems(
                icon: Icon(
                  Icons.person,
                ),
                backgroundColor: Colors.amber,
                selectedColor: Colors.pinkAccent,
                title: Text('Profile')),
          ],

          iconSize: 32,
          barAnimation: BarAnimation.liquid,
          iconStyle: IconStyle.animated,
          hasNotch: true,
          fabLocation: StylishBarFabLocation.end,
          opacity: 0.3,
          currentIndex: selected ?? 0,

          onTap: (index) {
            setState(() {
              selected = index;
            });
          },
        ),*/
    );
  }

  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem(
      {String? icon,
        String? label,
        bool isActive = false,
        GestureTapCallback? press}) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 38,
        height: 38,
        child: IconButton(
          onPressed: press,
          icon: SvgPicture.asset(icon ?? "assets/icons/star.svg",
              color: isActive ? kPrimaryColor : Colors.black),
        ),
      ),
      label: label,
    );
  }
}
