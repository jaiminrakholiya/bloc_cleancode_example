import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {
  final fromkey;
  const LoginButton({super.key,required this.fromkey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if(fromkey.currentState!.validate()){
            print('i am here');
          }
        },
        child: Text('Login')
    );
  }
}
