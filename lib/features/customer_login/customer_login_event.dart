part of 'customer_login_bloc.dart';

@immutable
abstract class CustomerLoginEvent {}

class LoginUserEvent extends CustomerLoginEvent {
  final String email;
  final String password;

  LoginUserEvent(this.email, this.password);
}
