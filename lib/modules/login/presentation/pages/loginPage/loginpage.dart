import 'package:amazonmusiclone/modules/login/domain/services/oauth.dart';
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
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Welcome!  ...",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                inputTextField(
                  controller: usernameController,
                  obscureText: false,
                  hintText: "Enter username or e-mail",
                ),
                const SizedBox(
                  height: 5,
                ),
                inputTextField(
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: true),
                const SizedBox(
                  height: 5,
                ),
                Button(onTap: signUserIn, text: "Sign In"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.4,
                        color: Colors.grey.shade700,
                      )),
                      const Text("Or continue with"),
                      Expanded(
                          child: Divider(
                        thickness: 0.4,
                        color: Colors.grey.shade700,
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
    );
  }
}
