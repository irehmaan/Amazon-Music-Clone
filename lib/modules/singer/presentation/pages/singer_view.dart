import 'package:amazonmusiclone/modules/singer/domain/model/singermodel.dart';
import 'package:amazonmusiclone/modules/songs/presentation/pages/song_page.dart';
import 'package:amazonmusiclone/settings/themes/light_theme.dart';
import 'package:amazonmusiclone/settings/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingerView extends StatelessWidget {
  Function singer;
  SingerView({super.key, required this.singer});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: singer(),
      builder: (context, AsyncSnapshot<List<Singer>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something Went Wrong..."),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            height: 180,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                Songs(singerName: snapshot.data![index].name)));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor:
                              context.read<ThemeProvider>().themeData ==
                                      lighTheme
                                  ? Colors.grey.shade700
                                  : Colors.black,
                          backgroundImage: NetworkImage(
                            snapshot.data![index].photo,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data![index].name,
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
