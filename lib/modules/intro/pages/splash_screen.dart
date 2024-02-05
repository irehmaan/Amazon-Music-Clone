import 'dart:async';

import 'package:amazonmusiclone/modules/dashboard/pages/dashboard.dart';
import 'package:amazonmusiclone/modules/login/presentation/pages/authpage/authPage.dart';
import 'package:flutter/material.dart';

import '../../../settings/constants/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirstLogo = true;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isFirstLogo = false;
      setState(() {});
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const SplashScreenScreen2()));
    });

    // Second Timer Add
    Timer(const Duration(seconds: 3), () {
      isFirstLogo = false;
      setState(() {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthPage()));
    });
  }

  List<Widget> _showLogo() {
    Size size = MediaQuery.of(context).size;
    if (isFirstLogo) {
      return [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          height: size.height / 3,
          width: size.width * 0.90,
          child: Image.asset(
            AssetPath.AMAZON_LOGO,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        )
      ];
    } else {
      return [
        Container(
          padding: const EdgeInsets.all(5),
          height: size.height / 3,
          width: size.width / 2,
          child: Image.asset(
            AssetPath.AMAZON_LOGO2,
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: _showLogo()),
      ),
      backgroundColor: Colors.black,
    );
  }
}
