import 'package:amazonmusiclone/modules/login/domain/services/oauth.dart';
import 'package:amazonmusiclone/modules/login/domain/services/signInWithEmail.dart';
import 'package:amazonmusiclone/modules/login/presentation/widgets/button.dart';
import 'package:amazonmusiclone/modules/login/presentation/widgets/inputTextField.dart';
import 'package:amazonmusiclone/modules/login/presentation/widgets/sqtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _authService = AuthService();

  // sign in function
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await _authService.signInUser(
        usernameController.text,
        passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade100,
            title: Center(
              child: Text(message),
            ),
            actions: [
              Button(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Ok")
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.blueGrey[900]!.withOpacity(0.5),
                    Colors.blueGrey[900]!.withOpacity(0.9),
                    Colors.blueGrey[900]!.withOpacity(0.9),
                    Colors.blueGrey[900]!.withOpacity(0.9),
                  ])),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 70,
                      child: Image.asset("assets/images/amazon_logo2.png")),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Welcome !",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  inputTextField(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Enter username or e-mail",
                    showEye: false,
                  ),
                  inputTextField(
                      controller: passwordController,
                      hintText: "Enter password",
                      showEye: true,
                      obscureText: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(onTap: signUserIn, text: "Log In"),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        )),
                        const Text("Or continue with"),
                        Expanded(
                            child: Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        squareTile(
                          onTap: () => OAuthService().singWithGoogle(),
                          imgPath: 'assets/images/google.png',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Register now",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
