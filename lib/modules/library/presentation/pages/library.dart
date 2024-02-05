import 'package:amazonmusiclone/modules/components/ovalBox.dart';
import 'package:amazonmusiclone/modules/library/presentation/widgets/Tab.dart';
import 'package:amazonmusiclone/modules/library/presentation/widgets/podTab.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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

  final user = FirebaseAuth.instance.currentUser;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.54),
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
                setState(() {
                  tabFlag = false;
                });
              },
              Color: Colors.black.withOpacity(0.47),
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
                setState(() {
                  tabFlag = true;
                });
              },
              Color: Colors.black.withOpacity(0.47),
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
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.01,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          switchBtwTabs()
        ],
      ),
    );
  }
}
