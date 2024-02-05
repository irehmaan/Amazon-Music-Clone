import 'package:amazonmusiclone/firebase_options.dart';
import 'package:amazonmusiclone/modules/intro/pages/splash_screen.dart';
import 'package:amazonmusiclone/modules/player/audioPlayer/audioPlayer.dart';

import 'package:amazonmusiclone/modules/singer/domain/repo/singer_service.dart';
import 'package:amazonmusiclone/settings/themes/dark_theme.dart';
import 'package:amazonmusiclone/shared/services/apiClient.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _registerSingletons();

//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
      ChangeNotifierProvider(create: (ctx) => Player(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getDarkTheme(context),
      home: const SplashScreen(),
    );
  }
}

_registerSingletons() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<SingerService>(SingerService());
}
