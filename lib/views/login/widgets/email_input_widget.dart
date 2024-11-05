import 'package:bloc_clean_code_project/bloc/login/login_bloc.dart';
import 'package:bloc_clean_code_project/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {

  final FocusNode emailFocusNode;
  const EmailInputWidget({required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChangedEvent(email: value));
          },
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(
              hintText: "Enter Email",
              border: OutlineInputBorder()
          ),
          validator: (value) {
            if(value!.isEmpty) {
              return "Please Enter Email";
            }
            else if(Validations.emailValidator(value)){
              return "Invalid Email structure";
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