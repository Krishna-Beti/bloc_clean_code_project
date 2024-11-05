import 'package:bloc_clean_code_project/bloc/login/login_bloc.dart';
import 'package:bloc_clean_code_project/main.dart';
import 'package:bloc_clean_code_project/repository/auth/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(
                  height: 20,
                ),
                PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                const SizedBox(
                  height: 50,
                ),
                LoginButton(formKey: _formKey)
              ],
            ),
          ),
        ),
      ),
    );
  }
}