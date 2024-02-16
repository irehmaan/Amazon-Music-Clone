import 'package:amazonmusiclone/modules/dashboard/pages/dashboard.dart';
import 'package:amazonmusiclone/modules/login/presentation/pages/loginOrRegister/loginOrRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Dashboard();
            } else {
              return const LoginOrRegister();
            }
          },
        ),
      ),
    );
  }
}
