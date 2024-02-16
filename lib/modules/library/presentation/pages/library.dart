import 'package:amazonmusiclone/modules/components/ovalBox.dart';
import 'package:amazonmusiclone/modules/library/presentation/widgets/Tab.dart';
import 'package:amazonmusiclone/modules/library/presentation/widgets/podTab.dart';
import 'package:amazonmusiclone/settings/themes/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  Library({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    bool tabFlag = false;

    switchBtwTabs() {
      if (tabFlag == false) {
        tabFlag = true;
        return const Tabs(
            lenght: 3, tab1: "Playlists", tab2: "Songs", tab3: "Albums");
      } else {
        tabFlag = false;
        return const PodTab(
            lenght: 4,
            tab1: "LATEST",
            tab2: "SHOWS",
            tab3: "DOWNLOADED",
            tab4: "PLAYLIST");
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 35,
              width: 100,
              child: ovalbox(
                onTap: () {
                  tabFlag = false;
                },
                child: const Text(
                  "MUSIC",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 35,
              width: 100,
              child: ovalbox(
                onTap: () {
                  tabFlag = true;
                },
                child: const Text(
                  "PODCAST",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            )
          ]),
          actions: <Widget>[
            PopupMenuButton(
              icon: const Icon(Icons.settings),
              color: Colors.grey.withOpacity(0.8),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: Text('Connect'),
                ),
                const PopupMenuItem(
                  child: Text('Settings'),
                ),
                const PopupMenuItem(
                  child: Text('Cast'),
                ),
                PopupMenuItem(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(user!.photoURL!)),
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Free",
                      style: TextStyle(
                          color: Colors.cyan, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("My library",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.01,
                ),
              ],
            ),
            ValueListenableBuilder(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Switch Theme"),
                    Switch(
                        value: _isDarkTheme.value,
                        activeColor: Colors.grey.shade900,
                        activeTrackColor: Colors.grey,
                        onChanged: (value) {
                          _isDarkTheme.value = value;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme();
                        }),
                  ],
                );
              },
              valueListenable: _isDarkTheme,
            ),
            const SizedBox(
              height: 15,
            ),
            switchBtwTabs()
          ],
        ),
      ),
    );
  }
}

final ValueNotifier<bool> _isDarkTheme = ValueNotifier<bool>(false);
