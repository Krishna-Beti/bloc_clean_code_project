import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {

  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChangedEvent(password: value));
          },
          keyboardType: TextInputType.text,
          obscureText: true,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
              hintText: "Enter Password",
              border: OutlineInputBorder()
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter Password";
            }
            else {
              return null;
            }
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}