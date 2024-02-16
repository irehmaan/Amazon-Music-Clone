import 'package:amazonmusiclone/modules/login/presentation/widgets/button.dart';
import 'package:amazonmusiclone/modules/login/presentation/widgets/inputTextField.dart';
import 'package:amazonmusiclone/modules/login/presentation/widgets/sqtile.dart';
import 'package:flutter/material.dart';

import '../../../domain/services/oauth.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
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
                    "Let's get you started !!",
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  inputTextField(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Enter Your Name",
                    showEye: false,
                  ),
                  inputTextField(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Enter your e-mail",
                    showEye: false,
                  ),
                  inputTextField(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Enter Password",
                    showEye: true,
                  ),
                  inputTextField(
                    controller: passwordController,
                    hintText: "Confirm password",
                    obscureText: true,
                    showEye: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Button(onTap: () {}, text: "Sign Up"),
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
                        const Text("Continue Sign with"),
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
                      const Text("Already a member?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Login",
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
