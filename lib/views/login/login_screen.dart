import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Scrren'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: _fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 20),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(height: 20),
                LoginButton(fromkey: _fromkey)
              ],
            )),
      ),
    );
  }
}
