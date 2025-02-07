import 'package:bloc_cleancode_example/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final fromkey;

  const LoginButton({super.key, required this.fromkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.message.toString())),
            );
        }

        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.message.toString())),
            );
        }

        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('submitting...')),
            );
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
          buildWhen: (current, previous) => false,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (fromkey.currentState!.validate()) {
                      context.read<LoginBloc>().add(LoginApi());
                  }
                },
                child: Text('Login'));
          }),
    );
  }
}
