part of 'customer_login_bloc.dart';

@immutable
abstract class CustomerLoginEvent {}

class LoginCustomerEvent extends CustomerLoginEvent {
  final String email;
  final String password;

  LoginCustomerEvent(this.email, this.password);
}
