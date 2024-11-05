import 'package:bloc_clean_code_project/config/routes/routes_name.dart';
import 'package:bloc_clean_code_project/utils/enums.dart';
import 'package:bloc_clean_code_project/utils/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';

class LoginButton extends StatelessWidget {

  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if(state.postApiStatus == PostApiStatus.error){
          FlushBarHelper.flushBarErrorMessage(state.message.toString(), context);
        }

        if(state.postApiStatus == PostApiStatus.success){
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginButtonEvent());
            }
          }, child: state.postApiStatus == PostApiStatus.loading ? CircularProgressIndicator() : const Text("Login"));
        },
      ),
    );
  }
}
