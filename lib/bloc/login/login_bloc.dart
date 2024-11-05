import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code_project/repository/auth/login_repository.dart';
import 'package:bloc_clean_code_project/services/session_manager/session_controller.dart';
import 'package:bloc_clean_code_project/utils/enums.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {

  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginButtonEvent>(_onLoginButtonEvent);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginButtonEvent(LoginButtonEvent event, Emitter<LoginStates> emit) async {

    Map data = {"email": state.email, "password": state.password};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((value) async {
      if(value.token.isNotEmpty){
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreferences();
        emit(state.copyWith(message: "Login Successful", postApiStatus: PostApiStatus.success));
      }else{
        emit(state.copyWith(message: value.error.toString(), postApiStatus: PostApiStatus.error));
      }
    },).onError((error, stackTrace) {
      emit(state.copyWith(message: error.toString(), postApiStatus: PostApiStatus.error));
    },);
  }

}