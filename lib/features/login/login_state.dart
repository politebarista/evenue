part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginPendingState extends LoginState {}

class LoginFailureState extends LoginState {}
