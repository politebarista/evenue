part of 'customer_login_bloc.dart';

@immutable
abstract class CustomerLoginState {}

class CustomerLoginInitialState extends CustomerLoginState {}

class CustomerLoginPendingState extends CustomerLoginState {}

class CustomerLoginFailureState extends CustomerLoginState {}
