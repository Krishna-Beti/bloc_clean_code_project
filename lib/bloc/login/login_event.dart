part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends LoginEvents {
  final String email;
  const EmailChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailUnfocusedEvent extends LoginEvents {}

class PasswordChangedEvent extends LoginEvents {
  final String password;
  const PasswordChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordUnfocusedEvent extends LoginEvents {}

class LoginButtonEvent extends LoginEvents {}