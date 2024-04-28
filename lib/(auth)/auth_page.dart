import 'package:crud/pages/login_page.dart';
import 'package:crud/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
// show login page
  bool showLoginPage = true;

  void togglePage() async {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: togglePage);
    } else {
      return RegisterPage(showLoginPage: togglePage);
    }
  }
}
