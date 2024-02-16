import 'package:amazonmusiclone/modules/alexa/presentation/pages/alexaPage.dart';
import 'package:amazonmusiclone/modules/home/presentation/pages/home.dart';
import 'package:amazonmusiclone/modules/library/presentation/pages/library.dart';
import 'package:amazonmusiclone/modules/player/pages/extended_player.dart';
import 'package:amazonmusiclone/modules/searchpage/presentation/pages/searchpage.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    final GetIt _getIt = GetIt.instance;
    final size = MediaQuery.of(context).size;
    final ValueNotifier<bool> hideMiniPlayer =
        _getIt.get<ValueNotifier<bool>>(instanceName: 'hideMiniPlayer');

    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          //  SystemNavigator.pop();
          // Navigator.of(context);
          if (didPop) {
            return;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              PersistentTabView(context,
                  handleAndroidBackButtonPress: true,
                  padding: const NavBarPadding.symmetric(vertical: 2),
                  // hideNavigationBar: context.read<Player>().hideNavigationBar,
                  confineInSafeArea: true,
                  screens: _buildScreens(),
                  controller: _controller,
                  items: _navbarItems(),
                  screenTransitionAnimation: const ScreenTransitionAnimation(
                    animateTabTransition: true,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                  ),
                  navBarStyle: NavBarStyle.style14,
                  decoration: const NavBarDecoration(
                      colorBehindNavBar: Colors.transparent),
                  hideNavigationBarWhenKeyboardShows: true,
                  backgroundColor: Colors.transparent),
              ValueListenableBuilder(
                valueListenable: hideMiniPlayer,
                builder: (context, value, child) {
                  return Align(
                      alignment:
                          AlignmentDirectional(size.height, size.height / 1000),
                      child:
                          Visibility(visible: value, child: ExtendedPlayer()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  final List<Widget> screens = <Widget>[
    const Home(),
    const SearchPage(),
    Library(),
    const AlexPage(),

    // const Login()
  ];
  return screens;
}

List<PersistentBottomNavBarItem>? _navbarItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: Colors.cyan.shade200,
      inactiveColorPrimary: Colors.grey.shade400,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: ("Find"),
      activeColorPrimary: Colors.cyan.shade200,
      inactiveColorPrimary: Colors.grey.shade400,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("Library"),
      activeColorPrimary: Colors.cyan.shade200,
      inactiveColorPrimary: Colors.grey.shade400,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.assistant),
      // scale: 1,

      title: ("Alexa"),
      activeColorPrimary: Colors.cyan.shade200,
      inactiveColorPrimary: Colors.grey.shade400,
      iconSize: 25,
      // textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
    ),

    // )
  ];
}
