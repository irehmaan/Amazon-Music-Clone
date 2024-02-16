import 'package:amazonmusiclone/firebase_options.dart';
import 'package:amazonmusiclone/modules/intro/pages/splash_screen.dart';
import 'package:amazonmusiclone/modules/player/audioPlayer%20Service/audioPlayer.dart';
import 'package:amazonmusiclone/modules/singer/domain/repo/singer_service.dart';
import 'package:amazonmusiclone/settings/themes/theme_provider.dart';
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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Player(),
        ),
        ChangeNotifierProvider(create: (ctx) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
    );
  }
}

_registerSingletons() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<ApiClient>(ApiClient());
  getIt.registerSingleton<SingerService>(SingerService());
  getIt.registerLazySingleton<ValueNotifier<bool>>(
      () => ValueNotifier<bool>(false),
      instanceName: 'extendedPlayer');
  getIt.registerLazySingleton<ValueNotifier<bool>>(() => ValueNotifier(true),
      instanceName: 'hideMiniPlayer');
}
