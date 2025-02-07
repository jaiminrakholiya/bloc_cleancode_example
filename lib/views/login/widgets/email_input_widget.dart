import 'package:bloc_cleancode_example/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/validations.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key,required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginStates>(
        buildWhen: (current,previous) => current.email != previous.email,
        builder: (context,state){
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder()
            ),
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }
              if(!Validations.emailValidator(value)){
                return 'Email is not correct';
              }
              return null;
            },
            onFieldSubmitted: (value) {},
          );
        }
    );
  }
}
