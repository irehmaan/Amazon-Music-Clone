import 'package:amazonmusiclone/modules/home/presentation/pages/home.dart';
import 'package:amazonmusiclone/modules/library/presentation/pages/library.dart';
import 'package:amazonmusiclone/modules/searchpage/presentation/pages/searchpage.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      handleAndroidBackButtonPress: true,
      hideNavigationBar: false,
      confineInSafeArea: true,
      screens: _screens(),
      controller: _controller,
      items: _navbarItems(),
      backgroundColor: Colors.black.withOpacity(0.5),
      navBarStyle: NavBarStyle.style6,
      stateManagement: true,
      resizeToAvoidBottomInset: false,
      hideNavigationBarWhenKeyboardShows: true,
    );
  }
}

List<Widget> _screens() {
  final List<Widget> screens = <Widget>[
    const Home(),
    const SearchPage(),
    const Library(),
    const Text("Alexa Screen"),
    // const Login()
  ];
  return screens;
}

List<PersistentBottomNavBarItem>? _navbarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: Colors.cyan,
      inactiveColorPrimary: Colors.grey,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: ("Find"),
      activeColorPrimary: Colors.cyan,
      inactiveColorPrimary: Colors.grey,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Library"),
      activeColorPrimary: Colors.cyan,
      inactiveColorPrimary: Colors.grey,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.assistant),
      // scale: 1,

      title: ("Alexa"),
      activeColorPrimary: Colors.cyan,
      inactiveColorPrimary: Colors.grey,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    // PersistentBottomNavBarItem(
    //   icon: const Icon(Icons.login),
    //   title: ("ALEXA"),
    //   activeColorPrimary: Colors.cyan,
    //   inactiveColorPrimary: Colors.grey,
    //   iconSize: 30,
    //   // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    // )
  ];
}
