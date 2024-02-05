import 'package:amazonmusiclone/modules/login/presentation/pages/loginPage/loginpage.dart';
import 'package:amazonmusiclone/modules/login/presentation/pages/registerPage/registerPage.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
