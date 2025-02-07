import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';
class LoginButton extends StatelessWidget {
  final fromkey;
  const LoginButton({super.key,required this.fromkey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginStates>(
        buildWhen: (current,previous) => false,
        builder: (context,state){
          return  ElevatedButton(
              onPressed: () {
                if(fromkey.currentState!.validate()){
                  print('i am here');

                }
              },
              child: Text('Login')
          );
        }
    );


  }
}
