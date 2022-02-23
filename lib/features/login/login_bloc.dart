import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evenue/features/login/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository = UserRepository();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>(_loginUserHandler);
  }

  void _loginUserHandler(LoginUserEvent event, Emitter<LoginState> emit) async {
    final isUserLoggedIn = await _userRepository.login(
      event.email,
      event.password,
    );
    if (isUserLoggedIn) {
      emit(LoginSuccessState());
    } else {
      emit(LoginFailureState());
    }
  }
}
