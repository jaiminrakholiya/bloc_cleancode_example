import 'package:bloc_cleancode_example/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _fromkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Scrren'),
      ),
      body: BlocProvider(
          create: (_) => _loginBloc ,
        child: Padding(
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
      ),
    );
  }
}
